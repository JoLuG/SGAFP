package controlador;

import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import jakarta.security.enterprise.credential.UsernamePasswordCredential;
import jakarta.security.enterprise.identitystore.CredentialValidationResult;
import jakarta.security.enterprise.identitystore.IdentityStoreHandler;
import jakarta.security.enterprise.identitystore.PasswordHash;

@Stateless
public class UsuarioBean {

    @Inject
    private IdentityStoreHandler identityStoreHandler;

    @Inject
    private PasswordHash passwordHash;

    public String login(String correo, String password) {
        // Validar las credenciales del usuario
        CredentialValidationResult validationResult = identityStoreHandler.validate(
                new UsernamePasswordCredential(correo, password));

        if (validationResult.getStatus() == CredentialValidationResult.Status.VALID) {
            // Inicio de sesión exitoso
            return "perfil"; // Cambia "perfil" por la página a la que quieres redirigir después del inicio de sesión
        } else {
            // Credenciales incorrectas
            return "error"; // Cambia "error" por la página de error o el mensaje de error que desees mostrar
        }
    }
}
