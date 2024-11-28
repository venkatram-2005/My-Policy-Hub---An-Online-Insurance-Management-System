import sys
import json
import pandas as pd
import pickle

MODEL_PATH = "V:/Eclipse Projects/Insurance_Management/src/main/resources/scripts/health_charges_model.pkl"

try:
    with open(MODEL_PATH, "rb") as f:
        model = pickle.load(f)
except FileNotFoundError:
    print(json.dumps({"error": f"Model file not found at {MODEL_PATH}"}))
    sys.exit(1)

if len(sys.argv) > 1:
    try:
        input_json = json.loads(sys.argv[1])

        # Preprocess the input to match the model's feature order
        input_df = pd.DataFrame([input_json])
        feature_order = ["age", "sex", "bmi", "children", "smoker", "region"]
        input_df["sex"] = input_df["sex"].map({"male": 0, "female": 1})
        input_df["smoker"] = input_df["smoker"].map({"no": 0, "yes": 1})
        input_df["region"] = input_df["region"].map({"southwest": 0, "southeast": 1, "northwest": 2, "northeast": 3})
        input_df = input_df[feature_order]

        # Make prediction
        prediction = model.predict(input_df)
        print(json.dumps({"prediction": prediction[0]}))  # Output only JSON
    except Exception as e:
        print(json.dumps({"error": str(e)}))  # Output errors as JSON
else:
    print(json.dumps({"error": "No input data received"}))
