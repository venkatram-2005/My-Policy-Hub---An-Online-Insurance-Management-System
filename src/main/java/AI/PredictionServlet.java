package AI;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import org.json.JSONObject;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/predict")
public class PredictionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        // Step 1: Collect inputs from the JSP form
        String age = request.getParameter("age");
        String sex = request.getParameter("sex");
        String bmi = request.getParameter("bmi");
        String children = request.getParameter("children");
        String smoker = request.getParameter("smoker");
        String region = request.getParameter("region");

        // Debug: Print input values
        System.out.println("Received Input:");
        System.out.println("Age: " + age);
        System.out.println("Sex: " + sex);
        System.out.println("BMI: " + bmi);
        System.out.println("Children: " + children);
        System.out.println("Smoker: " + smoker);
        System.out.println("Region: " + region);

        // Step 2: Build JSON input for the Python script
        JSONObject inputJson = new JSONObject();
        try {
            inputJson.put("age", Integer.parseInt(age));
            inputJson.put("sex", sex);
            inputJson.put("bmi", Float.parseFloat(bmi));
            inputJson.put("children", Integer.parseInt(children));
            inputJson.put("smoker", smoker);
            inputJson.put("region", region);
        } catch (NumberFormatException e) {
            out.write("{\"error\": \"Invalid input format: " + e.getMessage() + "\"}");
            return;
        }

        String jsonString = inputJson.toString();
        System.out.println("Constructed JSON String: " + jsonString);

        // Step 3: Define the Python script path
        String scriptPath = "V:/Eclipse Projects/Insurance_Management/src/main/resources/scripts/predict.py";

        // Debug: Check if the script exists
        File scriptFile = new File(scriptPath);
        System.out.println("Resolved Script Path: " + scriptPath);
        System.out.println("Script Exists: " + scriptFile.exists());

        if (!scriptFile.exists()) {
            out.write("{\"error\": \"Python script not found at path: " + scriptPath + "\"}");
            return;
        }

        // Step 4: Execute the Python script
        try {
            // Wrap the JSON string in double quotes to ensure it passes correctly
            String safeJsonString = "\"" + jsonString.replace("\"", "\\\"") + "\"";

            // Debug: Print the final command and JSON being passed
            System.out.println("Final JSON Argument: " + safeJsonString);

            // Use ProcessBuilder to call the Python script
            ProcessBuilder pb = new ProcessBuilder("python", scriptPath, safeJsonString);

            // Start the process
            Process process = pb.start();

            // Capture the output and error streams
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            BufferedReader errorReader = new BufferedReader(new InputStreamReader(process.getErrorStream()));

            StringBuilder output = new StringBuilder();
            String line;

            while ((line = reader.readLine()) != null) {
                output.append(line);
            }

            StringBuilder errors = new StringBuilder();
            while ((line = errorReader.readLine()) != null) {
                errors.append(line);
            }

            int exitCode = process.waitFor();

            System.out.println("Python Script Output: " + output);
            System.out.println("Python Script Errors: " + errors);
            System.out.println("Exit Code: " + exitCode);

            if (exitCode == 0) {
                // Parse the output JSON to extract the prediction
                String outputString = output.toString();
                System.out.println("Raw Output from Python: " + outputString);

                try {
                    // Parse the JSON output from the Python script
                    JSONObject outputJson = new JSONObject(outputString);

                    if (outputJson.has("prediction")) {
                        // Extract the prediction value
                        double prediction = outputJson.getDouble("prediction");
                        // Round off to 2 decimal places
                        prediction = Math.round(prediction * 100.0) / 100.0;
                        System.out.println("Extracted Prediction: " + prediction);

                        // Set the prediction as a request attribute
                        request.setAttribute("charges", prediction);

                        // Forward the request to predictionform.jsp
                        RequestDispatcher dispatcher = request.getRequestDispatcher("predictionform.jsp");
                        dispatcher.forward(request, response);
                        
                    } else {
                        // Handle case where prediction is missing in the Python output
                        out.write("{\"error\": \"Prediction key missing in Python output.\"}");
                    }
                } catch (Exception e) {
                    // Handle JSON parsing errors
                    e.printStackTrace();
                    out.write("{\"error\": \"Failed to parse Python output: " + e.getMessage() + "\"}");
                }
            } else {
                out.write("{\"error\": \"Python script failed with exit code: " + exitCode + "\", \"details\": \"" + errors.toString() + "\"}");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.write("{\"error\": \"An error occurred: " + e.getMessage() + "\"}");
        }

    }
}
