package br.edu.ifs.playifs.shared.web;

import br.edu.ifs.playifs.shared.exceptions.BusinessException;
import br.edu.ifs.playifs.shared.exceptions.ResourceNotFoundException;
import br.edu.ifs.playifs.shared.web.dto.CustomError;
import br.edu.ifs.playifs.shared.web.dto.ValidationError;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.ConstraintViolationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.time.Instant;
import java.util.stream.Collectors;

@ControllerAdvice
public class ControllerExceptionHandler {

    // Adiciona um logger para registar os erros
    private static final Logger logger = LoggerFactory.getLogger(ControllerExceptionHandler.class);

    @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<CustomError> resourceNotFound(ResourceNotFoundException e, HttpServletRequest request) {
        HttpStatus status = HttpStatus.NOT_FOUND; // 404
        CustomError err = new CustomError(Instant.now(), status.value(), e.getMessage(), request.getRequestURI());
        return ResponseEntity.status(status).body(err);
    }

    @ExceptionHandler(BusinessException.class)
    public ResponseEntity<CustomError> businessException(BusinessException e, HttpServletRequest request) {
        HttpStatus status = HttpStatus.UNPROCESSABLE_ENTITY; // 422
        CustomError err = new CustomError(Instant.now(), status.value(), e.getMessage(), request.getRequestURI());
        return ResponseEntity.status(status).body(err);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<CustomError> methodArgumentNotValid(MethodArgumentNotValidException e, HttpServletRequest request) {
        HttpStatus status = HttpStatus.UNPROCESSABLE_ENTITY; // 422
        ValidationError err = new ValidationError(Instant.now(), status.value(), "Dados inválidos", request.getRequestURI());
        for (FieldError f : e.getBindingResult().getFieldErrors()) {
            err.addError(f.getField(), f.getDefaultMessage());
        }
        return ResponseEntity.status(status).body(err);
    }

    // NOVO HANDLER: Para erros de permissão (ex: @PreAuthorize falha)
    @ExceptionHandler(AccessDeniedException.class)
    public ResponseEntity<CustomError> accessDenied(AccessDeniedException e, HttpServletRequest request) {
        HttpStatus status = HttpStatus.FORBIDDEN; // 403
        CustomError err = new CustomError(Instant.now(), status.value(), "Acesso negado", request.getRequestURI());
        return ResponseEntity.status(status).body(err);
    }

    // HANDLER GENÉRICO ATUALIZADO: Captura qualquer outra exceção não tratada
    @ExceptionHandler(Exception.class)
    public ResponseEntity<CustomError> handleAllExceptions(Exception e, HttpServletRequest request) {
        HttpStatus status = HttpStatus.INTERNAL_SERVER_ERROR; // 500
        // Loga o stack trace completo do erro no servidor para depuração
        logger.error("Erro inesperado: ", e);
        CustomError err = new CustomError(Instant.now(), status.value(), "Erro inesperado no servidor.", request.getRequestURI());
        return ResponseEntity.status(status).body(err);
    }

    @ExceptionHandler(ConstraintViolationException.class)
    public ResponseEntity<CustomError> constraintViolation(ConstraintViolationException e, HttpServletRequest request) {
        HttpStatus status = HttpStatus.BAD_REQUEST; // 400
        // Monta uma mensagem de erro a partir das violações encontradas
        String errorMessage = e.getConstraintViolations().stream()
                .map(cv -> cv.getMessage())
                .collect(Collectors.joining(", "));

        CustomError err = new CustomError(Instant.now(), status.value(), errorMessage, request.getRequestURI());
        return ResponseEntity.status(status).body(err);
    }

}