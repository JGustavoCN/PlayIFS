package br.edu.ifs.playifs.game;

import br.edu.ifs.playifs.competition.model.GameGroup; // Importar se já não estiver
import br.edu.ifs.playifs.game.model.Game;
import br.edu.ifs.playifs.game.model.enums.GamePhase;
import br.edu.ifs.playifs.game.model.enums.GameStatus;
import jakarta.persistence.criteria.Join; // Importar
import jakarta.persistence.criteria.JoinType;
import org.springframework.data.jpa.domain.Specification;

public final class GameSpecification {

    public static Specification<Game> hasTeam(Long teamId) {
        return (root, query, cb) -> {
            if (teamId == null) return cb.conjunction();
            return cb.or(
                    cb.equal(root.join("teamA", JoinType.LEFT).get("id"), teamId),
                    cb.equal(root.join("teamB", JoinType.LEFT).get("id"), teamId)
            );
        };
    }

    public static Specification<Game> inCompetition(Long competitionId) {
        return (root, query, cb) -> {
            if (competitionId == null) return cb.conjunction();
            // Filtra por teamA.competition.id (como já estava)
            return cb.equal(root.join("teamA", JoinType.LEFT).join("competition", JoinType.LEFT).get("id"), competitionId);
        };
    }

    public static Specification<Game> hasSport(Long sportId) {
        return (root, query, cb) -> {
            if (sportId == null) return cb.conjunction();
            return cb.equal(root.join("teamA", JoinType.LEFT).join("sport", JoinType.LEFT).get("id"), sportId);
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