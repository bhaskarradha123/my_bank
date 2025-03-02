# 🏦 Banking Application



- This project is a Banking Web Application built using Java ,Servlets, JSP, and a relational database. It provides users with secure banking functionalities such as balance checking, money transfers, and transaction history tracking.

  ## Features

- ✅ User Authentication – Secure login and session management.
- ✅ Transaction History – View past transactions with details.
- ✅ Responsive Dashboard – Off-canvas menu and advertisement sections for a dynamic user
- ✅ Account Management – Create and manage multiple bank accounts.
- ✅ Balance Inquiry – Check account balances with PIN verification.
- ✅ Money Transfer – Transfer funds between accounts or via phone numbers.

  # TECHNOLOGIES USED 📌

## Front End 📫

![HTML5](https://img.shields.io/static/v1?style=for-the-badge&message=HTML5&color=E34F26&logo=HTML5&logoColor=FFFFFF&label=)
![CSS3](https://img.shields.io/static/v1?style=for-the-badge&message=CSS3&color=1572B6&logo=CSS3&logoColor=FFFFFF&label=)
![JavaScript](https://img.shields.io/static/v1?style=for-the-badge&message=JavaScript&color=222222&logo=JavaScript&logoColor=F7DF1E&label=)
![Bootstrap](https://img.shields.io/static/v1?style=for-the-badge&message=Bootstrap&color=7952B3&logo=Bootstrap&logoColor=FFFFFF&label=)

## Server Side ⚡

![Java](https://img.shields.io/static/v1?style=for-the-badge&message=Java&color=007396&logo=java&logoColor=FFFFFF&label=)
![Servlets](https://img.shields.io/static/v1?style=for-the-badge&message=Servlets&color=7952B3&logo=Java&logoColor=FFFFFF&label=)
![Jsp](https://img.shields.io/static/v1?style=for-the-badge&message=Jsp&color=E34F26&logo=Java&logoColor=FFFFFF&label=)
![JDBC](https://img.shields.io/static/v1?style=for-the-badge&message=JDBC&color=222223&logo=jdbc&logoColor=FFFFFF&label=)



## Development 🔭

![Java](https://img.shields.io/static/v1?style=for-the-badge&message=Open+JDK+18&color=blue6&label=)

## Development Tools 📺

![Eclipse](https://img.shields.io/static/v1?style=for-the-badge&message=eclipse&color=007396&logo=eclipse&logoColor=FFFFFF&label=)

## Database 📦

![Mysql](https://img.shields.io/static/v1?style=for-the-badge&message=MySQL&color=7952B3&logo=mysql&logoColor=FFFFFF&label=)

## API's 🌍

![Static Badge](https://img.shields.io/badge/RozarPay%20-API-blue)










# 🚀 Installation Guide

### 1. Clone the Repository
```sh
git clone https://github.com/bhaskarradha123/my_bank.git
cd my_bank
```

### 2. Set Up Database
- Update `db configuration in UserDao` with your database credentials.  

### 3. Run the Application
- Deploy on a **Tomcat Server**.  
- Access the app at `http://localhost:8080/my_bank/index.jsp`.  

---

## 📂 Project Structure

```
/my_bank
│── src/main/java
│   ├── com.ty.dao/             # Database operations
│   │    ├──BankAccountDao.java
│   │    ├──TransactionsDao.java
│   │    ├──UserDao.java
│   ├── com.ty.dto/                    # Data Transfer Objects
│   │    ├──BankAccount.java
│   │    ├──TransactionDao.java
│   │    ├──User.java 
│   ├── com.ty.controller/             # Servlets for handling requests
│   │    ├──BankTransfer.java
│   │    ├──checkBalance.java
│   │    ├──CrateAccount.java
│   │    ├──DeleteServlet.java
│   │    ├──DisplayTransactions.java
│   │    ├──FetchBankDetailsServlet.java
│   │    ├──ForgetPwd.java
│   │    ├──ImageServlet.java
│   │    ├──LoginServlet.java
│   │    ├──LogoutServlet.java
│   │    ├──RegisterServlet.java
│   │    ├──SelfTransfer.java
│   │    ├──TransferMoney.java
│   │    ├──Update_Profile_Image.java
│   │    ├──UpdatePassword.java
│   │    ├──UpdateServlet.java
│── src/main/webapp/
│   ├── account.jsp
│   ├── bankTransfer.jsp
│   ├── checkBalannce.jsp
│   ├── dashboard.jsp
│   ├── delete.jsp
│   ├── error400.jsp
│   ├── error404.jsp
│   ├── error405.jsp
│   ├── error500.jsp
│   ├── forgetPassword.jsp
│   ├── index.jsp
│   ├── login.jsp
│   ├── moneyTransfer.jsp
│   ├── phoneTransfer.jsp
│   ├── selfTransfer.jsp
│   ├── signup.jsp
│   ├── successRegistration.jsp
│   ├── transactions.jsp
│   ├── update.jsp
│── pom.xml


```

---

## 📝 API Endpoints

| Endpoint      | Method | Description          |
|--------------|--------|----------------------|
| `/login`     | POST   | User login          |
| `/save`  | POST   | New user signup     |
| `/update`  | POST   | User profile update    |
| `/updatePwd`  | POST   | User Password update    |
| `/updatepr`  | POST   | User profile image update    |
| `/checkbalance` | POST  | Fetch account balance |
| `/transfer`  | POST   | Transfer money      |

---

## 🤝 Contribution

1. **Fork** the repo  
2. **Create a feature branch**: `git checkout -b feature-name`  
3. **Commit changes**: `git commit -m "Added new feature"`  
4. **Push** to GitHub: `git push origin feature-name`  
5. **Open a Pull Request**  

---

## 📧 Contact
📩 Email: mailmeasradha@gmail.com  
🔗 LinkedIn: [Profile](https://linkedin.com/in/bhaskarradha13/)  

---


