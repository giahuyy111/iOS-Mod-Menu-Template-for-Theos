#import "Menu.h"

// --- KHAI BÁO BIẾN ---
static int current_tab = 0;
bool b_Aimbot = false;
float f_Fov = 90.0f;
bool b_EspLine = false;

void DrawMenu() {
    // Style đen xám Hexa
    ImGuiStyle& style = ImGui::GetStyle();
    style.WindowRounding = 5.0f;
    style.Colors[ImGuiCol_WindowBg] = ImVec4(0.06f, 0.06f, 0.07f, 0.95f);
    style.Colors[ImGuiCol_Button] = ImVec4(0.12f, 0.12f, 0.14f, 1.00f);
    style.Colors[ImGuiCol_Header] = ImVec4(0.00f, 0.40f, 0.80f, 1.00f);

    ImGui::Begin("HEXA FF - IOS", nullptr, ImGuiWindowFlags_NoResize);

    // Cột trái
    ImGui::BeginChild("Tabs", ImVec2(100, 0), true);
    if (ImGui::Button("AIM", ImVec2(80, 40))) current_tab = 0;
    if (ImGui::Button("ESP", ImVec2(80, 40))) current_tab = 1;
    if (ImGui::Button("INFO", ImVec2(80, 40))) current_tab = 2;
    ImGui::EndChild();

    ImGui::SameLine();

    // Cột phải
    ImGui::BeginChild("Content", ImVec2(0, 0), true);
    if (current_tab == 0) {
        ImGui::Checkbox("Aimbot", &b_Aimbot);
        ImGui::SliderFloat("FOV", &f_Fov, 0, 360);
    } else if (current_tab == 1) {
        ImGui::Checkbox("ESP Line", &b_EspLine);
    } else if (current_tab == 2) {
        ImGui::Text("Version: 1.0");
        ImGui::Text("Status: Online");
    }
    ImGui::EndChild();

    ImGui::End();
}