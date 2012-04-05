/* 
 * Copyright 2008-2012 Mohawk College of Applied Arts and Technology
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); you 
 * may not use this file except in compliance with the License. You may 
 * obtain a copy of the License at 
 * 
 * http://www.apache.org/licenses/LICENSE-2.0 
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the 
 * License for the specific language governing permissions and limitations under 
 * the License.
 * 
 * User: $user$
 * Date: 01-09-2009
 **/
using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;
using System.Xml;

namespace MohawkCollege.EHR.HL7v3.MIF.MIF20
{
    /// <summary>
    /// Process an appendix annotation
    /// </summary>
    [XmlType(TypeName = "AppendixAnnotation", Namespace = "urn:hl7-org:v3/mif2")]
    public class AppendixAnnotation : ComplexAnnotation
    {

        private string name;
        private string title;

        /// <summary>
        /// Identifies what kind of annotation is being used
        /// </summary>
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1721:PropertyNamesShouldNotMatchGetMethods"), XmlAttribute("type")]
        public string Type { get; set; }

        /// <summary>
        /// The free form content of the annotation with the associated language
        /// </summary>
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1819:PropertiesShouldNotReturnArrays"), XmlElement("data")]
        public XmlNode[] Data { get; set; }

        /// <summary>
        /// Title of the annotation
        /// </summary>
        [XmlAttribute("title")]
        public string Title
        {
            get { return title; }
            set { title = value; }
        }
	
        /// <summary>
        /// Name of the annotation
        /// </summary>
        [XmlAttribute("name")]
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
	
    }
}