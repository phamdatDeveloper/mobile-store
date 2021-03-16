package vn.com.dutmobile.DAO;

import vn.com.dutmobile.model.AccountModel;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

public interface AccountDAO {
    //check xem username cua tai khoan da ton tai trong db hay chua
    boolean checkAccountExist(String username);

    //check xem email cua tai khoan da ton tai trong db hay chua
    boolean checkEmailExist(String email);

    //dang ki tai khoan moi
    void register(AccountModel accounts);

    //check login tai khoan
    AccountModel checkLogin(String username, String password);

    //check account
    boolean checkAccount(String username, String password);

    //get all account
    ArrayList<AccountModel> getAll();

    //update account
    void updateAccount(AccountModel accounts);

    //delete account
    void deleteAccount(String id);

    //insert account
    void insertAccount(AccountModel accounts);

    //get account by id
    AccountModel getAccountById(String id);

    // update user
    void updateUser(AccountModel accountModel , String id);

    // update Password user
    void updatePassword(AccountModel accountModel , String id);

    //reset password
    void resetPassword(AccountModel accountModel);
}
