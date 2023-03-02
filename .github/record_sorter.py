SECTIONS_TO_SORT = ["Apps", "Developer Tooling", "Deployment Tools", "Other Clients"]
NEWLINE = "\n"

def sort_section(lines: list[str]) -> list[str]:
    sorted_lines = []
    heading_buffer = []

    for line in lines:
        is_heading = line.startswith("#")
        is_list = line.startswith("-")

        if line == NEWLINE:
            continue

        if is_heading:
            heading_buffer.sort(key=str.casefold)
            sorted_lines.extend(heading_buffer + [NEWLINE])
            sorted_lines.append(line)
            heading_buffer = [NEWLINE]

        elif is_list:
            heading_buffer.append(line)

        else:
            if sorted_lines[-1] != NEWLINE:
                sorted_lines.append(NEWLINE)
            sorted_lines.append(line)

    if heading_buffer:
        heading_buffer.sort(key=str.casefold)
        sorted_lines.extend(heading_buffer + [NEWLINE])

    return sorted_lines


if __name__ == "__main__":
    README = open("README.md").readlines()
    README_sorted = README.copy()

    for section in SECTIONS_TO_SORT:
        section_start = README_sorted.index(f"### {section}\n")
        section_end = next(i for i in range(section_start + 1, len(README_sorted) + 1) if README_sorted[i].startswith("### "))
        README_sorted[section_start - 1:section_end] = sort_section(README_sorted[section_start:section_end])

    if README != README_sorted:
        open("README.md", "w").writelines(README_sorted)
