package util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.interfaces.DecodedJWT;

import java.util.Date;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import java.util.Date;

public class AccessToken {
    private static final String SECRET_KEY = "toideptrai";

    public static void main(String[] args) {
        // Generate a token
        String token = generateToken("john.doe");
        System.out.println("Token: " + token);

        // Verify and decode the token
        DecodedJWT decodedJWT = verifyAndDecodeToken(token);
        if (decodedJWT != null) {
            // Extract information from the token
            String username = decodedJWT.getSubject();
            Date expirationDate = decodedJWT.getExpiresAt();
            Date issueAt = decodedJWT.getIssuedAt();

            System.out.println("Username: " + username);
            System.out.println("Expiration Date: " + expirationDate);
            System.out.println(issueAt);
        }
    }

    public static String generateToken(String username) {
        Date now = new Date();
        Date expirationDate = new Date(now.getTime() + 3600000); // Token expires in 1 hour

        return JWT.create()
                .withSubject(username)
                .withIssuedAt(now)
                .withExpiresAt(expirationDate)
                .sign(Algorithm.HMAC256(SECRET_KEY));
    }

    public static DecodedJWT verifyAndDecodeToken(String token) {
        try {
            return JWT.require(Algorithm.HMAC256(SECRET_KEY))
                    .build()
                    .verify(token);
        } catch (Exception e) {
            // Token verification failed
            return null;
        }
    }
}

