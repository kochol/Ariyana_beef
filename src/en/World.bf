using System;

namespace ari
{
	public class World
	{
		void* _obj = null;

		// Constructor
		[CLink]
		static extern void* CreateWorld();

		public this()
		{
			_obj = CreateWorld();
		}

		// Destructor
		[CLink]
		static extern void DeleteWorld(void* _obj);

		public ~this()
		{
			DeleteWorld(_obj);
			_obj = null;
		}

		// Add system
		[CLink]
		static extern void AddSystemToWorld(void* _world, void* _system);

		public void AddSystem(AriSystem pSystem)
		{
			AddSystemToWorld(_obj, pSystem.[Friend]_obj);
		}

		[CLink]
		static extern void AddEntityToWorld(void* _world, ref EntityHandle _entity);

		public void AddEntity(Entity _entity)
		{
			AddEntityToWorld(_obj, ref _entity.Handle);
		}

		[CLink]
		static extern EntityHandle CreateEntityWorld();

		[CLink]
		static extern bool* GetEntityMembers(ref EntityHandle _entity);

		public static Entity CreateEntity()
		{
			var e = new [Friend]Entity(CreateEntityWorld());
			e.Replicates = GetEntityMembers(ref e.Handle);
			return e;
		}

		[CLink]
		static extern Node3dHandle CreateCameraComponent();

		public static Camera CreateCamera()
		{
			var cam = new Camera(CreateCameraComponent());
			cam.[Friend]Init();
			return cam;
		}

		[CLink]
		static extern void AddCameraToWorld(void* _world, ref EntityHandle _entity, Node3dHandle _camera);

		public void AddComponent(Entity _entity, Camera _camera)
		{
			AddCameraToWorld(_obj, ref _entity.Handle, _camera.[Friend]handle);
		}

		[CLink]
		static extern Node3dHandle CreateBoxShapeComponent();

		public static BoxShape CreateBoxShape()
		{
			var boxshape = new BoxShape(CreateBoxShapeComponent());
			boxshape.[Friend]Init();
			return boxshape;
		}

		[CLink]
		static extern void AddBoxShapeToWorld(void* _world, ref EntityHandle _entity, Node3dHandle _camera);

		public void AddComponent(Entity _entity, BoxShape _box)
		{
			AddBoxShapeToWorld(_obj, ref _entity.Handle, _box.[Friend]handle);
		}

		[CLink]
		static extern PropertyReplicatorHandle CreatePropertyReplicatorComponent();

		public static PropertyReplicator CreatePropertyReplicator()
		{
			return new PropertyReplicator(CreatePropertyReplicatorComponent());
		}

		[CLink]
		static extern void AddPropertyReplicatorToWorld(void* _world, ref EntityHandle _entity, ref PropertyReplicatorHandle _cmp);

		public void AddComponent(Entity _entity, PropertyReplicator _pr)
		{
			AddPropertyReplicatorToWorld(_obj, ref _entity.Handle, ref _pr.[Friend]handle);
		}

		[CLink]
		static extern void UpdateWorld(void* _obj, float _elapsedTime);

		public void Update(float _elapsedTime)
		{
			 UpdateWorld(_obj, _elapsedTime);
		}
	}
}
