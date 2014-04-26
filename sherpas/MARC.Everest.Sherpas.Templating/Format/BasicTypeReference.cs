﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Serialization;
using MARC.Everest.Connectors;
using MARC.Everest.DataTypes;
using MARC.Everest.Sherpas.Formatter.XML.ITS1;
using MARC.Everest.Interfaces;
using MARC.Everest.Formatters.XML.Datatypes.R1;

namespace MARC.Everest.Sherpas.Templating.Format
{
    /// <summary>
    /// Represents a reference to a complete concept domain
    /// </summary>
    [XmlType("BasicTypeReference", Namespace = "urn:marc-hi:everest/sherpas/template")]
    public class BasicTypeReference
    {
        /// <summary>
        /// Formatter
        /// </summary>
        private static ClinicalDocumentFormatter s_formatter = new ClinicalDocumentFormatter();

        private static ClinicalDocumentDatatypeFormatter s_dtformatter = new ClinicalDocumentDatatypeFormatter();


        private Type m_typeCache = null;

        /// <summary>
        /// Gets or sets the name of the referenced system
        /// </summary>
        [XmlAttribute("name")]
        public String Name { get; set; }

        /// <summary>
        /// Gets or sets the flavor 
        /// </summary>
        [XmlAttribute("flavor")]
        public String Flavor { get; set; }


        /// <summary>
        /// Gets or sets the hard linked type
        /// </summary>
        [XmlIgnore]
        public virtual Type Type
        {
            get
            {
                if (this.m_typeCache != null)
                    return this.m_typeCache;

                if (this.Name == null || this.Name == "IGraphable")
                    return typeof(IGraphable);

                String r1Name = this.Name;
                if (r1Name == "SD")
                    r1Name = "ED";
                if (this.Name.Contains("_"))
                    r1Name = r1Name.Substring(0, r1Name.IndexOf("_"));

                if (s_dtformatter.HandleStructure.Contains(r1Name))
                    try
                    {
                        this.m_typeCache = Util.ParseXSITypeName(this.Name);
                    }
                    catch { }
                
                if(this.m_typeCache == null)
                    try
                    {
                        this.m_typeCache = s_formatter.ParseXSITypeName(this.Name);
                    }
                    catch { }

                return this.m_typeCache;
            }
            set
            {
                if (value == typeof(IGraphable))
                    this.Name = "IGraphable";
                else if (typeof(ANY).IsAssignableFrom(value))
                    this.Name = Util.CreateXSITypeName(value);
                else
                    this.Name = s_formatter.CreateXSITypeName(value);

                // Bound?
                this.m_typeCache = value;
            }
        }
    }
}