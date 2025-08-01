package br.edu.ifs.playifs.shared.web.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
@Schema(description = "Estrutura padronizada para todas as respostas de sucesso da API.")
public class ApiResponseBody<T> {

    @Schema(description = "O dado principal da resposta. Pode ser um objeto, uma lista ou outro tipo de dado.")
    private T data;

    @Schema(description = "Uma mensagem opcional associada à resposta (ex: 'Operação realizada com sucesso').", example = "Recurso criado com sucesso.")
    private String message;

    public ApiResponseBody(T data) {
        this.data = data;
    }
}