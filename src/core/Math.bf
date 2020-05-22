using System;

namespace ari
{
	[CRepr]
	public struct Vector2
	{
		public float x;
		public float y;

		public this(float _x, float _y)
		{
			x = _x;
			y = _y;
		}

		public void Set(float _x, float _y) mut
		{
			x = _x;
			y = _y;
		}

		public void Set(float _v) mut
		{
			x = y = _v;
		}

		public static Vector2 operator * (Vector2 lhd, float rhd)
		{
			return Vector2(lhd.x * rhd, lhd.y * rhd);
		}

		public static Vector2 operator + (Vector2 lhd, float rhd)
		{
			return Vector2(lhd.x + rhd, lhd.y + rhd);
		}

		public static Vector2 operator + (Vector2 lhd, Vector2 rhd)
		{
			return Vector2(lhd.x + rhd.x, lhd.y + rhd.y);
		}
	}

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
