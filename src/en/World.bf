using System;

namespace ari
{
	public class World
	{
		void* _obj = null;

		[CLink]
		static extern void* CreateWorld();

		public this()
		{
			_obj = CreateWorld();
		}

		[CLink]
		static extern void DeleteWorld(void* _obj);

		public ~this()
		{
			DeleteWorld(_obj);
			_obj = null;
		}

		[CLink]
		static extern void AddSystemToWorld(void* _world, void* _system);

		public void AddSystem(AriSystem pSystem)
		{
			AddSystemToWorld(_obj, pSystem._obj);
		}

		[CLink]
		static extern EntityHandle CreateEntityWorld();

		public static EntityHandle CreateEntity()
		{
			return CreateEntityWorld();
		}

		[CLink]
		static extern Node3dHandle CreateCameraComponent();

		public static Camera CreateCamera()
		{
			var cam = new Camera(CreateCameraComponent());
			cam.Init();
			return cam;
		}

		[CLink]
		static extern void AddCameraToWorld(void* _world, ref EntityHandle _entity, Node3dHandle _camera);

		public void AddCamera(ref EntityHandle _entity, Camera _camera)
		{
			AddCameraToWorld(_obj, ref _entity, _camera.handle);
		}

		[CLink]
		static extern Node3dHandle CreateBoxShapeComponent();

		public static BoxShape CreateBoxShape()
		{
			var boxshape = new BoxShape(CreateBoxShapeComponent());
			boxshape.Init();
			return boxshape;
		}

		[CLink]
		static extern void AddBoxShapeToWorld(void* _world, ref EntityHandle _entity, Node3dHandle _camera);

		public void AddBoxShape(ref EntityHandle _entity, BoxShape _box)
		{
			AddBoxShapeToWorld(_obj, ref _entity, _box.handle);
		}

		[CLink]
		static extern void UpdateWorld(void* _obj, float _elapsedTime);

		public void Update(float _elapsedTime)
		{
			 UpdateWorld(_obj, _elapsedTime);
		}
	}
}
