package br.edu.ifs.playifs.shared.model;

import jakarta.persistence.Column;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.Instant;

@Getter
@Setter
@MappedSuperclass // Indica que esta classe é uma superclasse mapeada para as tabelas das subclasses
@EntityListeners(AuditingEntityListener.class) // Habilita o listener para preenchimento automático dos campos de auditoria
public abstract class AuditableEntity {

    @CreatedDate // Anotação do Spring Data para preencher a data de criação automaticamente
    @Column(name = "created_at", nullable = false, updatable = false, columnDefinition = "TIMESTAMP WITHOUT TIME ZONE")
    private Instant createdAt;

    @LastModifiedDate // Anotação do Spring Data para preencher a data da última modificação automaticamente
    @Column(name = "updated_at", columnDefinition = "TIMESTAMP WITHOUT TIME ZONE")
    private Instant updatedAt;
}