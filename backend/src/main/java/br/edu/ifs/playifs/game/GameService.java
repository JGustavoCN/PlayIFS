package br.edu.ifs.playifs.game;

import br.edu.ifs.playifs.game.dto.GameDTO;
import br.edu.ifs.playifs.game.dto.GameResultDTO;
import br.edu.ifs.playifs.game.dto.GameUpdateDTO;
import br.edu.ifs.playifs.game.dto.GameWoDTO;
import br.edu.ifs.playifs.game.model.Game;
import br.edu.ifs.playifs.game.model.enums.GameStatus;
import br.edu.ifs.playifs.shared.exceptions.BusinessException;
import br.edu.ifs.playifs.shared.exceptions.ResourceNotFoundException;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class GameService {

    @Autowired
    private GameRepository repository;

    @Transactional(readOnly = true)
    public Page<GameDTO> findAll(Long teamId, Pageable pageable) {
        Page<Game> page;
        if (teamId != null && teamId > 0) {
            page = repository.findByTeam(teamId, pageable);
        } else {
            page = repository.findAll(pageable);
        }
        return page.map(GameDTO::new);
    }

    @Transactional(readOnly = true)
    public GameDTO findById(Long id) {
        Game entity = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Jogo não encontrado com o ID: " + id));
        return new GameDTO(entity);
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
    public GameDTO update(Long id, GameUpdateDTO dto) {
        try {
            Game entity = repository.getReferenceById(id);
            entity.setDateTime(dto.getDateTime());
            entity = repository.save(entity);
            return new GameDTO(entity);
        }
        catch (EntityNotFoundException e) {
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }
    }

    @Transactional
    public GameDTO updateResult(Long id, GameResultDTO dto) {
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
        return new GameDTO(entity);
    }

    @Transactional
    public GameDTO registerWo(Long id, GameWoDTO dto) {
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

        return new GameDTO(entity);
    }

    @Transactional
    public GameDTO undoWo(Long id) {
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
        return new GameDTO(entity);
    }

}
