#tag Class
Class CGMutablePath
Inherits CGPath
	#tag Method, Flags = &h0
		Sub Constructor()
		  #if targetMacOS
		    soft declare function CGPathCreateMutable lib CarbonFramework () as Ptr
		    
		    me.Adopt CGPathCreateMutable, true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(path as CGPath)
		  //overrides superclass constructor
		  
		  if path is nil then
		    me.Constructor
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function CGPathCreateMutableCopy lib CarbonFramework (path as Ptr) as Ptr
		    
		    me.Adopt CGPathCreateMutableCopy(path), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddArc(x as Double, y as Double, r as Double, startAngle as Double, endAngle as Double, clockwise as Boolean)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddArc lib CarbonFramework (path as Ptr, m as Ptr, x as Single, y as Single, r as SIngle, startAngle as Single, endAngle as Single, clockwise as Boolean)
		    
		    CGPathAddArc me, nil, x, y, r, startAngle, endAngle, clockwise
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddArc(x as Double, y as Double, r as Double, startAngle as Double, endAngle as Double, clockwise as Boolean, m as CGAffineTransform)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddArc lib CarbonFramework (path as Ptr, ByRef m as CGAffineTransform, x as Single, y as Single, r as SIngle, startAngle as Single, endAngle as Single, clockwise as Boolean)
		    
		    CGPathAddArc me, m, x, y, r, startAngle, endAngle, clockwise
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddArcToPoint(x1 as Double, y1 as Double, x2 as Double, y2 as Double, r as Double, m as CGAffineTransform)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddArcToPoint lib CarbonFramework (path as Ptr, ByRef m as CGAffineTransform, x1 as Single, y1 as Single, x2 as Single, y2 as Single, r as Single)
		    
		    CGPathAddArcToPoint me, m, x1, y1, x2, y2, r
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddArcToPoint(x1 as Double, y1 as Double, x2 as Double, y2 as Double, r as Double)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddArcToPoint lib CarbonFramework (path as Ptr, m as Ptr, x1 as Single, y1 as Single, x2 as Single, y2 as Single, r as Single)
		    
		    CGPathAddArcToPoint me, nil, x1, y1, x2, y2, r
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddCurveToPoint(cx1 as Double, cy1 as Double, cx2 as Double, cy2 as Double, x as Double, y as Double, m as CGAffineTransform)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddCurveToPoint lib CarbonFramework (path as Ptr, ByRef m as CGAffineTransform, cx1 as Single, cy1 as Single, cx2 as Single, cy2 as Single, x as Single, y as Single)
		    
		    CGPathAddCurveToPoint me, m, cx1, cy1, cx2, cy2, x, y
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddCurveToPoint(cx1 as Double, cy1 as Double, cx2 as Double, cy2 as Double, x as Double, y as Double)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddCurveToPoint lib CarbonFramework (path as Ptr, m as Ptr, cx1 as Single, cy1 as Single, cx2 as Single, cy2 as Single, x as Single, y as Single)
		    
		    CGPathAddCurveToPoint me, nil, cx1, cy1, cx2, cy2, x, y
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddEllipseInRect(rect as CGRect, m as CGAffineTransform)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddEllipseInRect lib CarbonFramework (path as Ptr, ByRef m as CGAffineTransform, rect as CGRect)
		    
		    CGPathAddEllipseInRect me, m, rect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddEllipseInRect(rect as CGRect)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddEllipseInRect lib CarbonFramework (path as Ptr, m as Ptr, rect as CGRect)
		    
		    CGPathAddEllipseInRect me, nil, rect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddLines(points() as CGPoint, m as CGAffineTransform)
		  if me = nil then
		    return
		  end if
		  
		  if UBound(points) = -1 then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddLines lib CarbonFramework (path as Ptr, ByRef m as CGAffineTransform, points as Ptr, count as Integer)
		    
		    CGPathAddLines me, m, CArray(points), 1 + UBound(points)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddLines(points() as CGPoint)
		  if me = nil then
		    return
		  end if
		  
		  if UBound(points) = -1 then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddLines lib CarbonFramework (path as Ptr, m as Ptr, points as Ptr, count as Integer)
		    
		    CGPathAddLines me, nil, CArray(points), 1 + UBound(points)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddLineToPoint(x as Double, y as Double, m as CGAffineTransform)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddLineToPoint lib CarbonFramework (path as Ptr, ByRef m as CGAffineTransform, x as Single, y as Single)
		    
		    CGPathAddLineToPoint me, m, x, y
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddLineToPoint(x as Double, y as Double)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddLineToPoint lib CarbonFramework (path as Ptr, m as Ptr, x as Single, y as Single)
		    
		    CGPathAddLineToPoint me, nil, x, y
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddPath(path as CGPath, m as CGAffineTransform)
		  if me = nil then
		    return
		  end if
		  if path is nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddPath lib CarbonFramework (path1 as Ptr, ByRef m as CGAffineTransform, path2 as Ptr)
		    
		    CGPathAddPath me, m, path
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddPath(path as CGPath)
		  if me = nil then
		    return
		  end if
		  if path is nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddPath lib CarbonFramework (path1 as Ptr, m as Ptr, path2 as Ptr)
		    
		    CGPathAddPath me, nil, path
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddQuadCurveToPoint(cx as Double, cy as Double, x as Double, y as Double, ByRef m as CGAffineTransform)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddQuadCurveToPoint lib CarbonFramework (path as Ptr, ByRef m as CGAffineTransform, cx as Single, cy as Single, x as Single, y as Single)
		    
		    CGPathAddQuadCurveToPoint me, m, cx, cy, x, y
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddQuadCurveToPoint(cx as Double, cy as Double, x as Double, y as Double)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddQuadCurveToPoint lib CarbonFramework (path as Ptr, m as Ptr, cx as Single, cy as Single, x as Single, y as Single)
		    
		    CGPathAddQuadCurveToPoint me, nil, cx, cy, x, y
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRect(rect as CGRect, m as CGAffineTransform)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddRect lib CarbonFramework (path as Ptr, ByRef m as CGAffineTransform, rect as CGRect)
		    
		    CGPathAddRect me, m, rect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRect(rect as CGRect)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddRect lib CarbonFramework (path as Ptr, m as Ptr, rect as CGRect)
		    
		    CGPathAddRect me, nil, rect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRects(rects() as CGRect, m as CGAffineTransform)
		  if me = nil then
		    return
		  end if
		  
		  if UBound(rects) < 0 then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddRects lib CarbonFramework (path as Ptr, ByRef m as CGAffineTransform, rects as Ptr, count as Integer)
		    
		    CGPathAddRects me, m, CArray(rects), 1 + UBound(rects)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRects(rects() as CGRect)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathAddRects lib CarbonFramework (path as Ptr, m as Ptr, rects as Ptr, count as Integer)
		    
		    CGPathAddRects me, nil, CArray(rects), 1 + UBound(rects)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CloseSubpath()
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathCloseSubpath lib CarbonFramework (path as Ptr)
		    
		    CGPathCloseSubpath me
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveToPoint(x as Double, y as Double, m as CGAffineTransform)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathMoveToPoint lib CarbonFramework (path as Ptr, ByRef m as CGAffineTransform, x as Single, y as Single)
		    
		    CGPathMoveToPoint me, m, x, y
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveToPoint(x as Double, y as Double)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGPathMoveToPoint lib CarbonFramework (path as Ptr, m as Ptr, x as Single, y as Single)
		    
		    CGPathMoveToPoint me, nil, x, y
		  #endif
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="IsEmpty"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="CGPath"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
