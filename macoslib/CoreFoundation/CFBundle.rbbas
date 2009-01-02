#tag Class
Class CFBundle
Inherits CFType
	#tag Event
		Function ClassID() As CFTypeID
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function ExecutableFile() As CFURL
		  #if TargetMacOS
		    soft declare function CFBundleCopyExecutableURL lib Carbon.CarbonFramework (theBundle as Ptr) as Ptr
		    
		    if not me.IsNULL then
		      dim theURL as new CFURL(CFBundleCopyExecutableURL(me.Reference), true)
		      if not theURL.IsNULL then
		        return theURL
		      end if
		    end if
		  #endif
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Resource(name as String, type as String, subDirectoryName as String) As CFURL
		  raise new RuntimeException // not available
		  'if not me.IsNULL then
		  '#if targetMacOS
		  'soft declare function CFBundleCopyResourceURL lib CarbonFramework (bundle as Integer, resourceName as Integer, resourceType as Integer, subDirName as Integer) as Integer
		  'soft declare function CFBundleCopyResourceURLInDirectory lib CarbonFramework (bundleURL as Integer, resourceName as Integer, resourceType as Integer, subDirName as Integer) as Integer
		  'soft declare function CFBundleCopyBundleURL lib CarbonFramework (bundle as Integer) as Integer
		  '
		  'dim theRef as Integer
		  'dim theURL as CFURL
		  'dim typeRef as Integer
		  'dim subDirRef as Integer
		  'dim urlRef as Integer
		  '
		  'If name Is Nil then
		  'Return Nil
		  'End if
		  'If type Is Nil then
		  'typeRef = 0
		  'Else
		  'typeRef = type
		  'End if
		  'If subDirectoryName Is Nil then
		  'subDirRef = 0
		  'Else
		  'subDirRef = subDirectoryName
		  'End if
		  '
		  'theRef = CFBundleCopyResourceURL(me, name, typeRef, subDirRef)
		  'CoreFoundation.CheckCFTypeRef theRef, "CFBundle", "Resource", "CFBundleCopyResourceURL"
		  'theURL = new CFURL(theRef)
		  '#endif
		  '
		  'Exception oops as CFTypeRefException
		  'theURL = Nil
		  '
		  'Finally
		  'CoreFoundation.Release theRef
		  'Return theURL
		  'End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourcesDirectory() As CFURL
		  #if targetMacOS
		    soft declare function CFBundleCopyResourcesDirectoryURL lib Carbon.CarbonFramework (theBundle as Ptr) as Ptr
		    
		    if not me.IsNULL then
		      dim theURL as new CFURL(CFBundleCopyResourcesDirectoryURL(me.Reference), true)
		      if theURL.Equals(nil) then
		        return nil
		      else
		        return theURL
		      end if
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataPointer(symbolName as String) As Ptr
		  #if TargetMacOS
		    soft declare function CFBundleGetDataPointerForName lib Carbon.CarbonFramework (bundle as Ptr, symbolName as CFStringRef) as Ptr
		    
		    if not me.IsNULL then
		      return CFBundleGetDataPointerForName(me.Reference, symbolName)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InfoDictionary() As CFDictionary
		  #if targetMacOS
		    soft declare function CFBundleGetInfoDictionary lib Carbon.CarbonFramework (bundle as Ptr) as Ptr
		    
		    if not me.IsNULL then
		      dim d as new CFDictionary(CFBundleGetInfoDictionary(me.Reference), false)
		      return d
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // This default constructor creates the application's CFBundle
		  
		  #if TargetMacOS
		    soft declare function CFBundleGetMainBundle lib Carbon.CarbonFramework () as Ptr
		    
		    dim p as Ptr = CFBundleGetMainBundle
		    if p <> nil then
		      me.Adopt p, true
		      me.Retain
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NewCFBundle(theURL as CFURL) As CFBundle
		  #if targetMacOS
		    if not (theURL is nil) then
		      soft declare function CFBundleCreate lib Carbon.CarbonFramework (allocator as Ptr, bundleURL as Ptr) as Ptr
		      
		      return new CFBundle(CFBundleCreate(nil, theURL.Reference), true)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NewCFBundle(bundleIdentifier as String) As CFBundle
		  #if targetMacOS
		    soft declare function CFBundleGetBundleWithIdentifier lib Carbon.CarbonFramework (bundleID as CFStringRef) as Ptr
		    
		    return new CFBundle(CFBundleGetBundleWithIdentifier(bundleIdentifier), false)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FrameworksDirectory() As CFURL
		  #if targetMacOS
		    soft declare function CFBundleCopyPrivateFrameworksURL lib Carbon.CarbonFramework (theBundle as Ptr) as Ptr
		    
		    if not me.IsNULL then
		      dim theURL as new CFURL(CFBundleCopyPrivateFrameworksURL(me.Reference), true)
		      if theURL.Equals(nil) then
		        return nil
		      else
		        return theURL
		      end if
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  #if targetMacOS
		    soft declare function CFBundleGetTypeID lib Carbon.CarbonFramework () as CFTypeID
		    static id as CFTypeID = CFBundleGetTypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CarbonFramework() As CFBundle
		  static v as CFBundle = NewCFBundle(CarbonBundleID)
		  return v
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CarbonBundle() As CFBundle
		  return NewCFBundle(CarbonBundleID)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InfoDictionaryValue(key as String) As CFType
		  raise new RuntimeException // not available
		  'if not me.IsNULL then
		  'dim valueRef as Integer
		  'dim theValue as CFPropertyList
		  '
		  'Const kCFPropertyListImmutable = 0
		  '
		  'If key Is Nil then
		  'Return Nil
		  'End if
		  '
		  '#if targetMacOS
		  'soft declare function CFBundleGetValueForInfoDictionaryKey lib CarbonFramework (bundle as Integer, key as Integer) as Integer
		  '
		  'valueRef = CFBundleGetValueForInfoDictionaryKey(me.Reference, key)
		  'If valueRef = 0 then //return an empty Dictionary
		  'Return nil
		  'End if
		  'theValue = CoreFoundation.NewCFPropertyListObject(valueRef, kCFPropertyListImmutable)
		  'Return CFType(theValue)
		  '
		  '#endif
		  'End if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Application() As CFBundle
		  // returns this app's main bundle
		  
		  static app as new CFBundle
		  return app
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			#if targetMacOS
			soft declare function CFBundleCopyBundleURL lib Carbon.CarbonFramework (bundle as Ptr) as Ptr
			
			if not me.IsNULL then
			dim theURL as new CFURL(CFBundleCopyBundleURL(me.Reference), true)
			if theURL.Equals(nil) then
			return nil
			else
			return theURL
			end if
			end if
			#endif
			End Get
		#tag EndGetter
		URL As CFURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			#if targetMacOS
			soft declare function CFBundleGetIdentifier lib Carbon.CarbonFramework (bundle as Ptr) as Ptr
			// Caution: If this would return a CFStringRef, we'd have to Retain its value!
			// Instead, "new CFString()" takes care of that below
			
			if not me.IsNULL then
			return new CFString(CFBundleGetIdentifier(me.Reference), false)
			end if
			#endif
			End Get
		#tag EndGetter
		Identifier As String
	#tag EndComputedProperty


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
			Name="Identifier"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
