import os
import json


if __name__ == "__main__":
    WORKSPACE = os.environ.get("GITHUB_WORKSPACE")
    AWESOME_FILE = f"{WORKSPACE}/README.md"

    FILE_ENTRIES_BY_LINE = open(AWESOME_FILE).readlines()
    USER_SUBMISSION: dict = json.loads(os.environ.get("submission_entry") or"{}")

    # add user submission to affirmations file
    category_index = FILE_ENTRIES_BY_LINE.index(f"### {USER_SUBMISSION['category']}\n")
    insert_at_index = category_index + 1

    if sub_category := USER_SUBMISSION['sub_category']:
        sub_category_index = FILE_ENTRIES_BY_LINE.index(f"#### {USER_SUBMISSION['sub_category']}\n", category_index)
        insert_at_index = sub_category_index + 1

    FILE_ENTRIES_BY_LINE.insert(insert_at_index, f"- [{USER_SUBMISSION['app_or_resource_name']}]({USER_SUBMISSION['app_or_resource_url']}) - {USER_SUBMISSION['app_or_resource_description']}\n")

    # update affirmations file
    with open(AWESOME_FILE, "w") as f:
        f.writelines(FILE_ENTRIES_BY_LINE)

    print(f"Updated {AWESOME_FILE} with {USER_SUBMISSION}")
