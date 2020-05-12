using ari;

namespace t01Init
{
	public class GameApp: Application
	{
		World _world = new World();
		RenderSystem _renderSystem = new RenderSystem();
		SceneSystem _sceneSystem = new SceneSystem();
		EntityHandle _entity;
		BoxShape _box;
		Camera _cam;

		public override void OnInit()
		{
			base.OnInit();
			_world.AddSystem(_renderSystem);
			_world.AddSystem(_sceneSystem);

			_entity = World.CreateEntity();

			_cam = World.CreateCamera();
			_cam.Position.x = _cam.Position.y = _cam.Position.z = 3.0f;
			_cam.Target.z = 0.0f;
			_world.AddCamera(ref _entity, _cam);

			_box = World.CreateBoxShape();
			_world.AddBoxShape(ref _entity, _box);
		}

		public override void OnFrame(float _elapsedTime)
		{
			base.OnFrame(_elapsedTime);
			_world.Update(_elapsedTime);
		}

		public override void OnCleanup()
		{
			base.OnCleanup();
			delete _world;
			delete _renderSystem;
			delete _sceneSystem;
			delete _box;
			delete _cam;
		}
	}
}
