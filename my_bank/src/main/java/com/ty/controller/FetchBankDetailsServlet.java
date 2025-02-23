package com.ty.controller;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

@WebServlet("/FetchBankDetailsServlet")
public class FetchBankDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ifscCode = request.getParameter("ifsc");
        JSONObject bankDetails = fetchBankDetails(ifscCode);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(bankDetails.toString());
    }

    private static JSONObject fetchBankDetails(String ifscCode) {
        try {
            String apiUrl = "https://ifsc.razorpay.com/" + ifscCode;
            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Accept", "application/json");

            if (conn.getResponseCode() != 200) {
                JSONObject errorResponse = new JSONObject();
                errorResponse.put("error", "Invalid IFSC Code");
                return errorResponse;
            }

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder response = new StringBuilder();
            String output;
            while ((output = br.readLine()) != null) {
                response.append(output);
            }
            conn.disconnect();
            return new JSONObject(response.toString());

        } catch (Exception e) {
            JSONObject errorResponse = new JSONObject();
            errorResponse.put("error", "Error fetching bank details");
            return errorResponse;
        }
    }
}
