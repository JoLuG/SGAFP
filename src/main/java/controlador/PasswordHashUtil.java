package controlador;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.security.enterprise.identitystore.PasswordHash;

@ApplicationScoped
public class PasswordHashUtil {

    @Inject
    private PasswordHash passwordHash;

    public String hashPassword(String password) {
        return passwordHash.generate(password.toCharArray());
    }

    public boolean verifyPassword(String password, String hashedPassword) {
        return passwordHash.verify(password.toCharArray(), hashedPassword);
    }
}
