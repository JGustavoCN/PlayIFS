package br.edu.ifs.playifs.shared.web.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import org.springframework.data.domain.Page;
import java.util.List;

@Getter
@Schema(description = "DTO padronizado para respostas paginadas, contendo apenas as informações essenciais para o cliente.")
public class PageDTO<T> {

    @Schema(description = "A lista de itens da página atual.")
    private final List<T> content;

    @Schema(description = "O número da página atual (iniciando em 0).", example = "0")
    private final int pageNumber;

    @Schema(description = "O número total de páginas disponíveis.", example = "5")
    private final int totalPages;

    @Schema(description = "O número total de elementos em todas as páginas.", example = "98")
    private final long totalElements;

    public PageDTO(Page<T> page) {
        this.content = page.getContent();
        this.pageNumber = page.getNumber();
        this.totalPages = page.getTotalPages();
        this.totalElements = page.getTotalElements();
    }
}