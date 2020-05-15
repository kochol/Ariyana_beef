using ari;

namespace t02Network
{
	public class NetworkApp: Application
	{
		World m_world = new World();
		RenderSystem m_renderSystem = new RenderSystem();
		SceneSystem m_sceneSystem = new SceneSystem();
		ServerSystem m_serverSystem = new ServerSystem();
		Entity m_entity;
		Camera m_cam;
		BoxShape m_box;
		PropertyReplicator m_pr;

		public override void OnInit()
		{
			base.OnInit();

			// Init network
			Net.InitNetwork();

			// Add systems
			m_world.AddSystem(m_renderSystem);
			m_world.AddSystem(m_sceneSystem);
			m_world.AddSystem(m_serverSystem);

			m_serverSystem.CreateServer("127.0.0.1", 55223);

			// Create entity
			m_entity = World.CreateEntity();
			*m_entity.Replicates = true;

			// Add camera
			m_cam = World.CreateCamera();
			m_cam.Position.Set(3.0f);
			m_cam.Target.z = 0.0f;
			m_world.AddComponent(m_entity, m_cam);

			// Add box
			m_box = World.CreateBoxShape();
			m_world.AddComponent(m_entity, m_box);

			// Add PropertyReplicator
			m_pr = World.CreatePropertyReplicator();
			m_world.AddComponent(m_entity, m_pr);
			m_pr.AddProperty(m_box, "Rotation");

			// At last add entity to world
			m_world.AddEntity(m_entity);
		}

		public override void OnFrame(float _elapsedTime)
		{
			base.OnFrame(_elapsedTime);
			m_box.Rotation.y += 0.9f * _elapsedTime;
			m_box.Rotation.x += 0.9f * _elapsedTime;
			m_world.Update(_elapsedTime);
		}

		public override void OnEvent(ari_event* _event, ref WindowHandle _handle)
		{
			base.OnEvent(_event, ref _handle);
		}

		public override void OnCleanup()
		{
			base.OnCleanup();
			delete m_world;
			delete m_renderSystem;
			delete m_sceneSystem;
			delete m_entity;
			delete m_cam;
			delete m_box;
			delete m_pr;

			m_serverSystem.StopServer();
			delete m_serverSystem;
			Net.ShutdownNetwork();
		}
	}
}
