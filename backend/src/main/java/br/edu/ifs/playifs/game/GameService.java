package br.edu.ifs.playifs.game;

import br.edu.ifs.playifs.game.dto.*;
import br.edu.ifs.playifs.game.model.Game;
import br.edu.ifs.playifs.game.model.enums.GameStatus;
import br.edu.ifs.playifs.shared.exceptions.BusinessException;
import br.edu.ifs.playifs.shared.exceptions.ResourceNotFoundException;
import br.edu.ifs.playifs.shared.web.dto.PageDTO;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class GameService {

    @Autowired
    private GameRepository repository;

    @Transactional(readOnly = true)
    public PageDTO<GameSummaryDTO> findAll(Long teamId, Pageable pageable) { // Tipo de retorno alterado
        Page<Game> page;
        if (teamId != null && teamId > 0) {
            page = repository.findByTeam(teamId, pageable);
        } else {
            page = repository.findAll(pageable);
        }
        Page<GameSummaryDTO> pageDto = page.map(GameSummaryDTO::new); // Criação do DTO alterada
        return new PageDTO<>(pageDto);
    }

    @Transactional(readOnly = true)
    public GameDetailsDTO findById(Long id) { // Tipo de retorno alterado
        Game entity = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Jogo não encontrado com o ID: " + id));
        return new GameDetailsDTO(entity); // Criação do DTO alterada
    }

    @Transactional
    public void delete(Long id) {
        if (!repository.existsById(id)) {
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }

        Game game = repository.findById(id).get();
        if (game.getStatus() != GameStatus.SCHEDULED) {
            throw new BusinessException("Não é possível apagar um jogo que não está com o status 'Agendado'.");
        }

        repository.deleteById(id);
    }

    @Transactional
    public void batchDelete(List<Long> ids) {
        List<Game> gamesToDelete = repository.findAllById(ids);

        if (gamesToDelete.size() != ids.size()) {
            throw new ResourceNotFoundException("Um ou mais jogos não foram encontrados.");
        }

        for (Game game : gamesToDelete) {
            if (game.getStatus() != GameStatus.SCHEDULED) {
                throw new BusinessException("Apenas jogos com o status 'SCHEDULED' podem ser apagados. O jogo com ID " + game.getId() + " não pode ser apagado.");
            }
        }

        repository.deleteAllInBatch(gamesToDelete);
    }

    @Transactional
    public GameDetailsDTO update(Long id, GameUpdateDTO dto) { // Tipo de retorno alterado
        try {
            Game entity = repository.getReferenceById(id);
            entity.setDateTime(dto.getDateTime());
            entity = repository.save(entity);
            return new GameDetailsDTO(entity); // Criação do DTO alterada
        }
        catch (EntityNotFoundException e) {
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }
    }

    @Transactional
    public GameDetailsDTO updateResult(Long id, GameResultDTO dto) { // Tipo de retorno alterado
        // Busca o jogo no banco de dados. Se não encontrar, lança exceção.
        Game entity = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Jogo não encontrado"));

        // Atualiza os placares
        entity.setScoreTeamA(dto.getScoreTeamA());
        entity.setScoreTeamB(dto.getScoreTeamB());

        // Atualiza o status do jogo para finalizado
        entity.setStatus(GameStatus.FINISHED);

        // Salva as alterações no banco
        entity = repository.save(entity);

        // Retorna o DTO com os dados atualizados
        return new GameDetailsDTO(entity); // Criação do DTO alterada
    }


    @Transactional
    public List<GameDetailsDTO> batchUpdateResults(List<GameResultItemDTO> resultItems) {
        // Extrai todos os IDs para uma busca otimizada
        List<Long> gameIds = resultItems.stream().map(GameResultItemDTO::getGameId).collect(Collectors.toList());

        // Busca todos os jogos de uma vez para reduzir acessos ao banco
        Map<Long, Game> gamesMap = repository.findAllById(gameIds).stream()
                .collect(Collectors.toMap(Game::getId, game -> game));

        List<Game> gamesToUpdate = new ArrayList<>();
        for (GameResultItemDTO item : resultItems) {
            Game entity = gamesMap.get(item.getGameId());

            if (entity == null) {
                throw new ResourceNotFoundException("Jogo não encontrado com o ID: " + item.getGameId());
            }
            if (entity.getStatus() != GameStatus.SCHEDULED) {
                throw new BusinessException("Apenas jogos com status 'SCHEDULED' podem ter o resultado atualizado. Jogo ID: " + entity.getId());
            }

            entity.setScoreTeamA(item.getScoreTeamA());
            entity.setScoreTeamB(item.getScoreTeamB());
            entity.setStatus(GameStatus.FINISHED);
            gamesToUpdate.add(entity);
        }

        List<Game> updatedGames = repository.saveAll(gamesToUpdate);

        return updatedGames.stream().map(GameDetailsDTO::new).collect(Collectors.toList());
    }

    @Transactional
    public GameDetailsDTO registerWo(Long id, GameWoDTO dto) { // Tipo de retorno alterado
        Game entity = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Jogo não encontrado"));

        Long winnerId = dto.getWinnerTeamId();
        Long teamAId = entity.getTeamA().getId();
        Long teamBId = entity.getTeamB().getId();

        if (!winnerId.equals(teamAId) && !winnerId.equals(teamBId)) {
            throw new BusinessException("A equipe vencedora não faz parte deste jogo.");
        }

        if (winnerId.equals(teamAId)) {
            entity.setScoreTeamA(1); // Placar simbólico
            entity.setScoreTeamB(0);
        } else {
            entity.setScoreTeamA(0);
            entity.setScoreTeamB(1);
        }

        entity.setStatus(GameStatus.WO);
        entity = repository.save(entity);

        return new GameDetailsDTO(entity); // Criação do DTO alterada
    }

    @Transactional
    public GameDetailsDTO undoWo(Long id) { // Tipo de retorno alterado
        Game entity = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Jogo não encontrado"));

        if (entity.getStatus() != GameStatus.WO) {
            throw new BusinessException("O jogo não está com status de W.O.");
        }

        // Reseta o jogo para o estado original
        entity.setStatus(GameStatus.SCHEDULED);
        entity.setScoreTeamA(null);
        entity.setScoreTeamB(null);

        entity = repository.save(entity);
        return new GameDetailsDTO(entity); // Criação do DTO alterada
    }

    @Transactional
    public List<GameDetailsDTO> batchUpdateDateTime(List<GameRescheduleItemDTO> scheduleItems) {
        List<Long> gameIds = scheduleItems.stream()
                .map(GameRescheduleItemDTO::getGameId)
                .collect(Collectors.toList());

        Map<Long, Game> gamesMap = repository.findAllById(gameIds).stream()
                .collect(Collectors.toMap(Game::getId, game -> game));

        List<Game> gamesToUpdate = new ArrayList<>();
        for (GameRescheduleItemDTO item : scheduleItems) {
            Game entity = gamesMap.get(item.getGameId());

            if (entity == null) {
                throw new ResourceNotFoundException("Jogo não encontrado com o ID: " + item.getGameId());
            }
            if (entity.getStatus() != GameStatus.SCHEDULED) {
                throw new BusinessException("Apenas jogos com status 'SCHEDULED' podem ser reagendados. Jogo ID: " + entity.getId());
            }

            entity.setDateTime(item.getDateTime());
            gamesToUpdate.add(entity);
        }

        List<Game> updatedGames = repository.saveAll(gamesToUpdate);

        return updatedGames.stream().map(GameDetailsDTO::new).collect(Collectors.toList());
    }

}