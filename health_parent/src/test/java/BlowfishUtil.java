import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.codec.binary.Hex;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class BlowfishUtil {
    private static final String BLOWFISH_ALGORITHM = "Blowfish";

    public static String encrypt(String key, String plaintext) {
        try {
            byte[] keyBytes = DigestUtils.md5(key);
            SecretKey secretKey = new SecretKeySpec(keyBytes, BLOWFISH_ALGORITHM);
            Cipher cipher = Cipher.getInstance(BLOWFISH_ALGORITHM);
            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
            byte[] encryptedBytes = cipher.doFinal(plaintext.getBytes());
            return new String(Base64.encodeBase64(encryptedBytes));
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static String decrypt(String key, String encryptedText) {
        try {
            byte[] keyBytes = DigestUtils.md5(key);
            SecretKey secretKey = new SecretKeySpec(keyBytes, BLOWFISH_ALGORITHM);
            Cipher cipher = Cipher.getInstance(BLOWFISH_ALGORITHM);
            cipher.init(Cipher.DECRYPT_MODE, secretKey);
            byte[] decryptedBytes = cipher.doFinal(Base64.decodeBase64(encryptedText));
            return new String(decryptedBytes);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}