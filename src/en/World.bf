using System;

namespace ari
{
	public class World
	{
		void* _obj = null;

		[CLink]
		static extern void* CreateWorld();

		[CLink]
		static extern void DeleteWorld(void* _obj);

		[CLink]
		static extern void UpdateWorld(void* _obj, float _elapsedTime);

		[CLink]
		static extern void AddSystemToWorld(void* _world, void* _system);

		[CLink]
		static extern EntityHandle CreateEntityWorld();

		public this()
		{
			_obj = CreateWorld();
		}

		public ~this()
		{
			DeleteWorld(_obj);
			_obj = null;
		}

		public void AddSystem(AriSystem pSystem)
		{
			AddSystemToWorld(_obj, pSystem._obj);
		}

		public EntityHandle CreateEntity()
		{
			return CreateEntityWorld();
		}

		public void Update(float _elapsedTime)
		{
			 UpdateWorld(_obj, _elapsedTime);
		}
	}
}
