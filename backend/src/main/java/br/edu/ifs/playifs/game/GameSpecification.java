package br.edu.ifs.playifs.game;

import br.edu.ifs.playifs.game.model.Game;
import br.edu.ifs.playifs.game.model.enums.GamePhase;
import br.edu.ifs.playifs.game.model.enums.GameStatus;
import jakarta.persistence.criteria.JoinType;
import org.springframework.data.jpa.domain.Specification;

public final class GameSpecification {

    public static Specification<Game> hasTeam(Long teamId) {
        return (root, query, cb) -> {
            if (teamId == null) return cb.conjunction();
            // Junta as duas condições com um OR para encontrar o jogo se a equipe for A ou B
            return cb.or(
                    cb.equal(root.join("teamA", JoinType.LEFT).get("id"), teamId),
                    cb.equal(root.join("teamB", JoinType.LEFT).get("id"), teamId)
            );
        };
    }

    public static Specification<Game> inCompetition(Long competitionId) {
        return (root, query, cb) -> {
            if (competitionId == null) return cb.conjunction();
            // Acessa a competição através da teamA. Assume que teamA sempre existirá.
            // Para garantir, fazemos um LEFT JOIN.
            return cb.equal(root.join("teamA", JoinType.LEFT).join("competition", JoinType.LEFT).get("id"), competitionId);
        };
    }

    public static Specification<Game> hasStatus(GameStatus status) {
        return (root, query, cb) ->
                status == null ? cb.conjunction() : cb.equal(root.get("status"), status);
    }

    public static Specification<Game> hasPhase(GamePhase phase) {
        return (root, query, cb) ->
                phase == null ? cb.conjunction() : cb.equal(root.get("phase"), phase);
    }
}