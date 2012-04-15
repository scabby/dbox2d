/*
* Copyright (c) 2006-2009 Erin Catto http://www.box2d.org
*
* This software is provided 'as-is', without any express or implied
* warranty.  In no event will the authors be held liable for any damages
* arising from the use of this software.
* Permission is granted to anyone to use this software for any purpose,
* including commercial applications, and to alter it and redistribute it
* freely, subject to the following restrictions:
* 1. The origin of this software must not be misrepresented; you must not
* claim that you wrote the original software. If you use this software
* in a product, an acknowledgment in the product documentation would be
* appreciated but is not required.
* 2. Altered source versions must be plainly marked as such, and must not be
* misrepresented as being the original software.
* 3. This notice may not be removed or altered from any source distribution.
*/

module box2d.dynamics.b2PolygonContact;

import box2d.common.b2Math;
import box2d.dynamics.b2Contact;
import box2d.dynamics.b2Fixture;
import box2d.collision.b2Collision;
import box2d.collision.b2CollidePolygon;
import box2d.collision.shapes.b2Shape;
import box2d.collision.shapes.b2PolygonShape;

class b2PolygonContact : b2Contact
{
public:
	static b2PolygonContact Create(b2Fixture fixtureA, int32 indexA,
								   b2Fixture fixtureB, int32 indexB)
	{
		return new b2PolygonContact(fixtureA, fixtureB);
	}

	this(b2Fixture fixtureA, b2Fixture fixtureB)
	{
		assert(fixtureA.GetType() == b2Shape.Type.e_polygon);
		assert(fixtureB.GetType() == b2Shape.Type.e_polygon);
		super(fixtureA, 0, fixtureB, 0);
	}

	override void Evaluate(ref b2Manifold manifold, b2Transform xfA, b2Transform xfB)
	{
		b2CollidePolygons(manifold,
						  cast(b2PolygonShape)m_fixtureA.GetShape(), xfA,
						  cast(b2PolygonShape)m_fixtureB.GetShape(), xfB);
	}
}