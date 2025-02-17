#pragma once

#include "JLE_ENGINE_CONFIG.h"
#include <string>

namespace jle
{
	struct jleEditorSettings
	{
		std::string editorBackgroundImage{ JLE_ENGINE_PATH + "/EditorResources/jle_default_bg.jpg" };
	};


#pragma region jleEditorSettings to/from json 
	using json = nlohmann::json;
	inline void to_json(nlohmann::json& j, const jleEditorSettings& es)
	{
		j["editor_background_image"] = es.editorBackgroundImage;
	}

	inline void from_json(const nlohmann::json& j, jleEditorSettings& es)
	{
		j.at("editor_background_image").get_to(es.editorBackgroundImage);
	}
#pragma endregion

}