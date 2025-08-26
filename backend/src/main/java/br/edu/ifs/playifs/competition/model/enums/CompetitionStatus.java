package br.edu.ifs.playifs.competition.model.enums;

import io.swagger.v3.oas.annotations.media.Schema;

/**
 * Enum que representa os possíveis status de uma competição.
 */
@Schema(description = "Representa os possíveis status de uma competição.")
public enum CompetitionStatus {
    /**
     * A competição está aberta para novas inscrições de equipas.
     */
    @Schema(description = "A competição está aberta para novas inscrições de equipas.")
    OPEN_FOR_REGISTRATION,

    /**
     * O período de inscrições terminou e os jogos estão a decorrer.
     */
    @Schema(description = "O período de inscrições terminou e os jogos estão a decorrer.")
    IN_PROGRESS,

    /**
     * A competição foi concluída e todos os resultados são finais.
     */
    @Schema(description = "A competição foi concluída e todos os resultados são finais.")
    FINISHED
}