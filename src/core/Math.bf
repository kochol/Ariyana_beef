using System;

namespace ari
{
	[CRepr]
	public struct Vector3
	{
		public float x;
		public float y;
		public float z;

		public void Set(float _x, float _y, float _z) mut
		{
			x = _x;
			y = _y;
			z = _z;
		}

		public void Set(float _v) mut
		{
			x = y = z = _v;
		}
	}

	[CRepr]
	public struct Quat
	{
		public float x;
		public float y;
		public float z;
		public float w;
	}
}
