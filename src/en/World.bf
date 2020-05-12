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

		public this()
		{
			_obj = CreateWorld();
		}

		public ~this()
		{
			DeleteWorld(_obj);
			_obj = null;
		}

		public void Update(float _elapsedTime)
		{
			 UpdateWorld(_obj, _elapsedTime);
		}
	}
}
