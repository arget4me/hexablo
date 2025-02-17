#pragma once

#include <vector>
#include <memory>

#include "jleGameSettings.h"
#include "jleEditorSettings.h"
#include "jleScene.h"

#include <iostream>

namespace jle
{

	class jleGame
	{
	public:
		virtual ~jleGame() {}
		virtual void Update(float dt) {}
		virtual void Start() {}

		static void OverrideGameSettings(jleGameSettings& gs) {}
		static void OverrideGameEditorSettings(jleGameSettings& gs, jleEditorSettings& es) {}

		void UpdateActiveScenes(float dt);

		template <typename T>
		std::shared_ptr<T> CreateScene()
		{
			static_assert(std::is_base_of<jleScene, T>::value, "T must derive from jleScene");

			std::shared_ptr<jleScene> newScene = std::make_shared<T>();
			mActiveScenes.push_back(newScene);

			newScene->OnSceneCreation();

			return newScene;
		}

		std::vector<std::shared_ptr<jleScene>>& GetActiveScenesRef();

	protected:
		std::vector<std::shared_ptr<jleScene>> mActiveScenes;
	};
}