package br.edu.ifs.playifs.services;

import br.edu.ifs.playifs.dto.GameDTO;
import br.edu.ifs.playifs.dto.GameResultDTO;
import br.edu.ifs.playifs.dto.GameWoDTO;
import br.edu.ifs.playifs.entities.Game;
import br.edu.ifs.playifs.entities.enums.GameStatus;
import br.edu.ifs.playifs.repositories.GameRepository;
import br.edu.ifs.playifs.services.exceptions.BusinessException;
import br.edu.ifs.playifs.services.exceptions.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class GameService {

    @Autowired
    private GameRepository repository;

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
