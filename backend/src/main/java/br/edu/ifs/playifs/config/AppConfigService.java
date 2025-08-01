package br.edu.ifs.playifs.config;

import br.edu.ifs.playifs.config.dto.AppConfigDTO;
import br.edu.ifs.playifs.config.dto.EnumValueDTO;
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel; // Importado o enum CourseLevel
import br.edu.ifs.playifs.game.model.enums.GamePhase;     // Importado o enum GamePhase
import br.edu.ifs.playifs.game.model.enums.GameStatus;     // Importado o enum GameStatus
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class AppConfigService {

    @Transactional(readOnly = true)
    public AppConfigDTO getAppConfig() {
        // Mapeia todos os enums relevantes para o frontend
        Map<String, List<EnumValueDTO>> enums = Map.of(
                "CourseLevel", mapEnumToDTO(CourseLevel.class),
                "GamePhase", mapEnumToDTO(GamePhase.class),
                "GameStatus", mapEnumToDTO(GameStatus.class)
        );

        return new AppConfigDTO(enums);
    }

    // Método auxiliar para mapear um enum para uma lista de EnumValueDTO
    private <E extends Enum<E>> List<EnumValueDTO> mapEnumToDTO(Class<E> enumClass) {
        return Arrays.stream(enumClass.getEnumConstants())
                .map(e -> new EnumValueDTO(e.name(), e.name()))
                .collect(Collectors.toList());
    }
}