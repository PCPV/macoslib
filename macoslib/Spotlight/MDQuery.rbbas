#tag Class
Class MDQuery
Inherits CFType
	#tag Method, Flags = &h0
		Sub Constructor(query as String)
		  #if targetMacOS
		    soft declare function MDQueryCreate lib CarbonFramework (allocator as Ptr, queryString as CFStringRef, valueListAttrs as Ptr, sortingAttrs as Ptr) as Ptr
		    
		    me.Adopt MDQueryCreate(nil, query, nil, nil), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetScope(scope as String)
		  #if targetMacOS
		    
		    soft declare sub MDQuerySetSearchScope lib CarbonFramework (query as Ptr, scopeDirectories as Ptr, scopeOptions as integer)
		    
		    dim cfList() as CFType
		    
		    dim s as CFString = scope
		    cfList.Append s
		    
		    
		    dim theArray as new CFArray(cfList)
		    
		    
		    
		    
		    MDQuerySetSearchScope me, theArray, 0
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Execute()
		  #if targetMacOS
		    soft declare function MDQueryExecute lib CarbonFramework (query as Ptr, optionFlags as Integer) as Boolean
		    
		    if MDQueryExecute(me, kMDQuerySynchronous) then
		      
		    else
		      
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResultList()
		  'CFIndex MDQueryGetResultCount (
		  'MDQueryRef query
		  ');
		  '
		  
		  #if targetMacOS
		    soft declare function MDQueryGetResultCount lib CarbonFramework(query as Ptr) as Integer
		    
		    dim lastIndex as Integer = MDQueryGetResultCount(me) - 1
		    dim theList() as String
		    for i as Integer = 0 to lastIndex
		      soft declare function MDQueryGetResultAtIndex lib CarbonFramework (query as Ptr, idx as Integer) as Ptr
		      
		      dim theItem as new MDItem(MDQueryGetResultAtIndex(me, i), false)
		      dim thePath as CFType = theItem.Attribute("kMDItemPath")
		      theList.Append CFString(thePath)
		    next
		    
		    break
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  #if targetMacOS
		    
		    soft declare function MDQueryGetTypeID lib CarbonFramework () as CFTypeID
		    
		    static id as CFTypeID = MDQueryGetTypeID
		    return id
		  #endif
		  
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = kMDQuerySynchronous, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMDQueryWantsUpdates, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			InheritedFrom="CFType"
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
