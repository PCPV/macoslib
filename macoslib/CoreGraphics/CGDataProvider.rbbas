#tag Class
Class CGDataProvider
Inherits CFType
	#tag Event
		Function ClassID() As CFTypeID
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(data as CFData)
		  if data is nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function CGDataProviderCreateWithCFData lib CarbonFramework (data as Ptr) as Ptr
		    
		    me.Adopt CGDataProviderCreateWithCFData(data), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(url as CFURL)
		  if url is nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function CGDataProviderCreateWithURL lib CarbonFramework (url as Ptr) as Ptr
		    
		    me.Adopt CGDataProviderCreateWithURL(url), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  soft declare function CGDataProviderGetTypeID lib CarbonFramework () as CFTypeID
		  
		  return CGDataProviderGetTypeID
		End Function
	#tag EndMethod


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
	#tag EndViewBehavior
End Class
#tag EndClass
