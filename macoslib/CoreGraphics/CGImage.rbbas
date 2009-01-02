#tag Class
Class CGImage
Inherits CFType
	#tag Event
		Function ClassID() As CFTypeID
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		 Shared Function NewCGImage(p as Picture) As CGImage
		  if p is nil then
		    return nil
		  end if
		  dim g as Graphics = p.Graphics
		  
		  if g is nil then //copy into new picture
		    dim pCopy as new Picture(p.Width, p.Height, 32)
		    dim gCopy as Graphics = pCopy.Graphics
		    if gCopy is nil then
		      return nil
		    end if
		    gCopy.DrawPicture p, 0, 0
		    p = pCopy
		    g = gCopy
		  end if
		  if g is nil then //I give up
		    return nil
		  end if
		  
		  dim gworldData as Ptr = Ptr(g.Handle(Graphics.HandleTypeCGrafPtr))
		  if gworldData = nil then
		    return nil
		  end if
		  
		  soft declare function QDBeginCGContext lib CarbonFramework (port as Ptr, ByRef contextPtr as Ptr) as Integer
		  
		  dim c as Ptr
		  dim OSError as Integer = QDBeginCGContext(gworldData, c)
		  if OSError <> 0 or c = nil then
		    return nil
		  end if
		  
		  
		  soft declare function CGBitmapContextCreateImage lib CarbonFramework (c as Ptr) as Ptr
		  
		  dim image as new CGImage(CGBitmapContextCreateImage(c), true)
		  
		  soft declare function QDEndCGContext lib CarbonFramework (port as Ptr, ByRef context as Ptr) as Integer
		  
		  OSError = QDEndCGContext(gworldData, c)
		  
		  return image
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  #if targetMacOS
		    soft declare function CGImageGetTypeID lib CarbonFramework () as CFTypeID
		    
		    return CGImageGetTypeID
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColorSpace() As CGColorSpace
		  if me = nil then
		    return nil
		  end if
		  
		  soft declare function CGImageGetColorSpace lib CarbonFramework (image as Ptr) as Ptr
		  
		  return new CGColorSpace(CGImageGetColorSpace(me), false)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(image as CGImage)
		  if image = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function CGImageCreateCopy lib CarbonFramework (image as Ptr) as Ptr
		    me.Adopt CGImageCreateCopy(image), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataProvider() As CGDataProvider
		  if me = nil then
		    return nil
		  end if
		  
		  #if targetMacOS
		    soft declare function CGImageGetDataProvider lib CarbonFramework (image as Ptr) as Ptr
		    
		    return new CGDataProvider(CGImageGetDataProvider(me), false)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateMask() As CGImage
		  if me = nil then
		    return nil
		  end if
		  
		  
		  #if targetMacOS
		    dim c as new CGBitmapContext(me.Width, me.Height, CGColorSpace.GenericGray)
		    c.DrawImage me, CGRectMake(0, 0, me.Width, me.Height)
		    dim image as CGImage = c.CopyImage
		    
		    soft declare function CGImageMaskCreate lib CarbonFramework (width as Integer, height as Integer, bitsPerComponent as Integer, bitsPerPixel as Integer, bytesPerRow as Integer, provider as Ptr, decode as Ptr, shouldInterpolate as Integer) as Ptr
		    
		    return new CGImage(CGImageMaskCreate(image.Width, image.Height,image.BitsPerComponent, image.BitsPerPixel, image.BytesPerRow, image.DataProvider, nil, 0), true)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(image as CGImage, colorspace as CGColorSpace)
		  if image = nil then
		    return
		  end if
		  
		  if colorspace is nil then
		    me.Constructor image
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function CGImageCreateCopyWithColorSpace lib CarbonFramework (image as Ptr, colorspace as Ptr) as Ptr
		    
		    me.Adopt CGImageCreateCopyWithColorSpace(image, colorspace), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(image as CGImage, minMaskColor as CGColor, maxMaskColor as CGColor)
		  if image is nil then
		    return
		  end if
		  
		  if minMaskColor is nil then
		    me.Constructor image
		    return
		  end if
		  if maxMaskColor is nil then
		    me.Constructor image
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function CGImageCreateWithMaskingColors lib CarbonFramework (image as Ptr, components as Ptr) as Ptr
		    
		    dim minComponents() as Double = minMaskColor.Components
		    dim maxComponents() as Double = maxMaskColor.Components
		    if UBound(minComponents) <> UBound(maxComponents) then
		      return
		    end if
		    
		    const sizeOfSingle = 4
		    dim components as new MemoryBlock(2*(1 + UBound(minComponents))*sizeOfSingle)
		    dim offset as Integer = 0
		    for index as Integer = 0 to UBound(minComponents)
		      components.SingleValue(offset) = minComponents(index)
		      offset = offset + 4
		      components.SingleValue(offset) = maxComponents(index)
		      offset = offset + 4
		    next
		    
		    me.Adopt CGImageCreateWithMaskingColors(image, components), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(image as CGImage, mask as CGImage)
		  if image is nil then
		    return
		  end if
		  
		  if mask is nil then
		    me.Constructor image
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function CGImageCreateWithMask lib CarbonFramework (image as Ptr, mask as Ptr) as Ptr
		    me.Adopt CGImageCreateWithMask(image, mask), true
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			if me = nil then
			return 0
			end if
			
			#if targetMacOS
			soft declare function CGImageGetWidth lib CarbonFramework (image as Ptr) as Integer
			
			return CGImageGetWidth(me)
			#endif
			End Get
		#tag EndGetter
		Width As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			if me = nil then
			return false
			end if
			
			#if targetMacOS
			soft declare function CGimageIsMask lib CarbonFramework (image as Ptr) as Boolean
			
			return CGImageIsMask(me)
			#endif
			End Get
		#tag EndGetter
		IsMask As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			if me = nil then
			return 0
			end if
			
			#if targetMacOS
			soft declare function CGImageGetHeight lib CarbonFramework (image as Ptr) as Integer
			
			return CGImageGetHeight(me)
			#endif
			End Get
		#tag EndGetter
		Height As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			if me = nil then
			return 0
			end if
			
			#if targetMacOS
			soft declare function CGImageGetBitsPerPixel lib CarbonFramework (image as Ptr) as Integer
			
			return CGImageGetBitsPerPixel(me)
			#endif
			End Get
		#tag EndGetter
		BitsPerPixel As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			if me = nil then
			return 0
			end if
			
			#if targetMacOS
			soft declare function CGImageGetBitsPerComponent lib CarbonFramework (image as Ptr) as Integer
			
			return CGImageGetBitsPerComponent(me)
			#endif
			End Get
		#tag EndGetter
		BitsPerComponent As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			if me = nil then
			return 0
			end if
			
			#if targetMacOS
			soft declare function CGImageGetBytesPerRow lib CarbonFramework (image as Ptr) as Integer
			
			return CGImageGetBytesPerRow(me)
			#endif
			End Get
		#tag EndGetter
		BytesPerRow As Integer
	#tag EndComputedProperty


	#tag Constant, Name = AlphaPremultipliedLast, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AlphaPremultipliedFirst, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AlphaLast, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AlphaFirst, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AlphaNoneSkipLast, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AlphaNoneSkipFirst, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
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
		#tag ViewProperty
			Name="Width"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsMask"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BitsPerPixel"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BitsPerComponent"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BytesPerRow"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
