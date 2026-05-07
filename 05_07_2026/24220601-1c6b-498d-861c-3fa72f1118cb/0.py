import pyperclip
import time
import csv
import os
from datetime import datetime

# === CHANGE THIS ===
SAVE_FOLDER = r"C:\Users\amara\Downloads\TOB\Down\YK"

# Make sure folder exists
os.makedirs(SAVE_FOLDER, exist_ok=True)

def get_today_file():
    today = datetime.now().strftime("%m-%d-%Y")
    return os.path.join(SAVE_FOLDER, f"{today}.csv")

last_text = ""

print("📋 Clipboard tracker started... (Ctrl+C to stop)")

while True:
    try:
        current_text = pyperclip.paste()

        if current_text and current_text != last_text:
            file_path = get_today_file()
            timestamp = datetime.now().strftime("%H:%M:%S")

            file_exists = os.path.isfile(file_path)

            with open(file_path, "a", newline="", encoding="utf-8") as f:
                writer = csv.writer(f)

                # Write header if file is new
                if not file_exists:
                    writer.writerow(["Time", "Copied Text"])

                writer.writerow([timestamp, current_text])

            print(f"Saved at {timestamp}")
            last_text = current_text

        time.sleep(1)

    except KeyboardInterrupt:
        print("\n🛑 Stopped.")
        break