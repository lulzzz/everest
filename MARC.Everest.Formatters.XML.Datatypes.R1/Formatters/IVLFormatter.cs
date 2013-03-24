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
 * User: computc
 * Date: 9/23/2009 12:16:22 PM
 **/
using System;
using System.Collections.Generic;
using System.Text;
using MARC.Everest.DataTypes;
using MARC.Everest.Connectors;
using MARC.Everest.Exceptions;
using MARC.Everest.Xml;
using MARC.Everest.Interfaces;
using System.Reflection;
using System.Xml;

namespace MARC.Everest.Formatters.XML.Datatypes.R1.Formatters
{
    /// <summary>
    /// IVL Formatter for DT R1
    /// </summary>
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1709:IdentifiersShouldBeCasedCorrectly", MessageId = "IVL")]
    public class IVLFormatter : PDVFormatter, IDatatypeFormatter
    {

        #region IDatatypeFormatter Members

        /// <summary>
        /// Graph object <paramref name="o"/> onto stream <paramref name="s"/>
        /// </summary>
        /// <param name="s">The stream to graph to</param>
        /// <param name="o">The object to graph</param>
        /// JF: Fixed Inclusive rendering issue with IVL
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily"), System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Globalization", "CA1305:SpecifyIFormatProvider", MessageId = "System.String.Format(System.String,System.Object)")]
        public override void Graph(System.Xml.XmlWriter s, object o, DatatypeFormatterGraphResult result)
        {
            
            base.Graph(s, o, result);

            if ((o as ANY).NullFlavor != null) return; // Nullflavor so the formatter doesn't format anything

            // Get the values the formatter needs to represent in XML
            Type ivlType = o.GetType();
            object operatorValue = ivlType.GetProperty("Operator").GetValue(o, null),
                lowValue = ivlType.GetProperty("Low").GetValue(o, null),
                highValue = ivlType.GetProperty("High").GetValue(o, null),
                widthValue = ivlType.GetProperty("Width").GetValue(o, null), 
                originalTextValue = ivlType.GetProperty("OriginalText").GetValue(o, null), 
                lowClosedValue = ivlType.GetProperty("LowClosed").GetValue(o,null),
                highClosedValue = ivlType.GetProperty("HighClosed").GetValue(o, null), 
                valueValue = ivlType.GetProperty("Value").GetValue(o, null);

            // Warn the developer if there are any properties that can't be represented in R1
            if (originalTextValue != null)
                result.AddResultDetail(new UnsupportedDatatypeR1PropertyResultDetail(ResultDetailType.Warning, "OriginalText", "IVL", s.ToString()));
            if (lowClosedValue != null || highClosedValue != null)
                result.AddResultDetail(new ResultDetail(ResultDetailType.Warning,
                    "The properties 'LowClosed' and 'HighClosed' will be used as low/@inclusive and high/@inclusive attributes for R1 formatting", s.ToString(), null));

            // Representations of the IVL type
            if(operatorValue != null)
                s.WriteAttributeString("operator", Util.ToWireFormat(operatorValue));
            
            
            if (lowValue != null && highValue != null) // low & high
            {
                // low
                if (lowClosedValue != null)
                    result.AddResultDetail(this.WriteValueAsElement(s, "low", (IGraphable)lowValue, this.GenericArguments[0], new KeyValuePair<String, String>("inclusive", Util.ToWireFormat(lowClosedValue))).Details);
                else
                    result.AddResultDetail(this.WriteValueAsElement(s, "low", (IGraphable)lowValue, this.GenericArguments[0]).Details);

                // high
                if (highClosedValue != null)
                    result.AddResultDetail(this.WriteValueAsElement(s, "high", (IGraphable)highValue, this.GenericArguments[0], new KeyValuePair<String, String>("inclusive", Util.ToWireFormat(highClosedValue))).Details);
                else
                    result.AddResultDetail(this.WriteValueAsElement(s, "high", (IGraphable)highValue, this.GenericArguments[0]).Details);


                #region Warnings
                if (valueValue != null)
                    result.AddResultDetail(new ResultDetail(ResultDetailType.Warning,
                        "low, high, value can't be represented together in an IVL data type in R1. The data has been formatted but may be invalid", s.ToString(), null));
                if (widthValue != null)
                    result.AddResultDetail(new ResultDetail(ResultDetailType.Warning,
                        "low, high, width can't be represented together in an IVL data type in R1. The data has been formatted but may be invalid", s.ToString(), null));
                #endregion
            }
            else if (lowValue != null && widthValue != null) // Low & width
            {
                // low
                if (lowClosedValue != null)
                    result.AddResultDetail(this.WriteValueAsElement(s, "low", (IGraphable)lowValue, this.GenericArguments[0], new KeyValuePair<String, String>("inclusive", Util.ToWireFormat(lowClosedValue))).Details);
                else
                    result.AddResultDetail(this.WriteValueAsElement(s, "low", (IGraphable)lowValue, this.GenericArguments[0]).Details);

                result.AddResultDetail(this.WriteValueAsElement(s, "width", (IGraphable)widthValue, typeof(PQ)).Details);

                #region Warnings
                if (valueValue != null)
                    result.AddResultDetail(new ResultDetail(ResultDetailType.Warning,
                        "low, width, value can't be represented together in an IVL data type in R1. The data has been formatted but may be invalid", s.ToString(), null));
                if (highValue != null)
                    result.AddResultDetail(new ResultDetail(ResultDetailType.Warning,
                        "low, width, high can't be represented together in an IVL data type in R1. The data has been formatted but may be invalid", s.ToString(), null));
                #endregion
            }            
            else if (highValue != null && widthValue != null) // high & width
            {
                result.AddResultDetail(this.WriteValueAsElement(s, "width", (IGraphable)widthValue, typeof(PQ)).Details);

                // high
                if (highClosedValue != null)
                    result.AddResultDetail(this.WriteValueAsElement(s, "high", (IGraphable)highValue, this.GenericArguments[0], new KeyValuePair<String, String>("inclusive", Util.ToWireFormat(highClosedValue))).Details);
                else
                    result.AddResultDetail(this.WriteValueAsElement(s, "high", (IGraphable)highValue, this.GenericArguments[0]).Details);


                #region Warnings
                if (valueValue != null)
                    result.AddResultDetail(new ResultDetail(ResultDetailType.Warning,
                        "high, width, value can't be represented together in an IVL data type in R1. The data has been formatted but may be invalid", s.ToString(), null));
                if (lowValue != null)
                    result.AddResultDetail(new ResultDetail(ResultDetailType.Warning,
                        "high, width, low can't be represented together in an IVL data type in R1. The data has been formatted but may be invalid", s.ToString(), null));
                #endregion
            }
            else if (lowValue != null) // low only
            {
                // low
                if (lowClosedValue != null)
                    result.AddResultDetail(this.WriteValueAsElement(s, "low", (IGraphable)lowValue, this.GenericArguments[0], new KeyValuePair<String, String>("inclusive", Util.ToWireFormat(lowClosedValue))).Details);
                else
                    result.AddResultDetail(this.WriteValueAsElement(s, "low", (IGraphable)lowValue, this.GenericArguments[0]).Details);

                if(valueValue != null)
                    result.AddResultDetail(new ResultDetail(ResultDetailType.Warning, "low and value can't be represented together in an IVL data type in R1. The data has been formatted but may be invalid", s.ToString(), null));

            }
            else if (highValue != null) // High only
            {
                // high
                if(highClosedValue != null)
                    result.AddResultDetail(this.WriteValueAsElement(s, "high", (IGraphable)highValue, this.GenericArguments[0], new KeyValuePair<String,String>("inclusive", Util.ToWireFormat(highClosedValue))).Details);
                else
                    result.AddResultDetail(this.WriteValueAsElement(s, "high", (IGraphable)highValue, this.GenericArguments[0]).Details);

                if (valueValue != null)
                    result.AddResultDetail(new ResultDetail(ResultDetailType.Warning, "high and value can't be represented together in an IVL data type in R1. The data has been formatted but may be invalid", s.ToString(), null));
            }
            else if (widthValue != null) // width only
            {
                result.AddResultDetail(this.WriteValueAsElement(s, "width", (IGraphable)widthValue, typeof(PQ)).Details);

                if (valueValue != null)
                    result.AddResultDetail(new ResultDetail(ResultDetailType.Warning, "width and value can't be represented together in an IVL data type in R1. The data has been formatted but may be invalid", s.ToString(), null));

            }
            else if (valueValue != null)
            {
                result.AddResultDetail(new NotSupportedChoiceResultDetail(
                    ResultDetailType.Warning, "Though XML ITS supports it, use of the IVL 'value' attribute should be avoided. The data has been serialized but may be uninterpretable by anoher system", s.ToString(), null));
                //DOC: Further documentation required.
            }
            // No need for this ;
            else
                result.AddResultDetail(new ResultDetail(ResultDetailType.Error,
                    "Can't create a valid representation of IVL using the supplied data for data types R1. Valid IVL must have [low & [high | width]] | [high & width] | high | value to satisfy data type R1 constraints",
                    s.ToString(), null));

        }

        /// <summary>
        /// Write a value as an element
        /// </summary>
        private IFormatterGraphResult WriteValueAsElement(XmlWriter s, String element, IGraphable value, Type expectedType, params KeyValuePair<String, String>[] attrs)
        {
            s.WriteStartElement(element, "urn:hl7-org:v3");

            // Value value xsi type
            if (expectedType != null && value.GetType() != expectedType)
                s.WriteAttributeString("xsi", "type", DatatypeFormatter.NS_XSI, Util.CreateXSITypeName(value.GetType()));

            if (attrs != null)
                foreach (var attr in attrs)
                    s.WriteAttributeString(attr.Key, attr.Value);

            var hostResult = Host.Graph(s, value);
            s.WriteEndElement();
            return hostResult;
        }

        /// <summary>
        /// Parse an object from <paramref name="s"/>
        /// </summary>
        /// <param name="s">The stream to parse from</param>
        /// <returns>The parsed object</returns>
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        public override object Parse(System.Xml.XmlReader s, DatatypeFormatterParseResult result)
        {
            // Create the types
            Type ivlType = typeof(IVL<>);
            Type ivlGenericType = ivlType.MakeGenericType(GenericArguments);

            // Create an instance of rto from the rtoType
            object instance = ivlGenericType.GetConstructor(Type.EmptyTypes).Invoke(null);

            if (s.GetAttribute("nullFlavor") != null)
                ((ANY)instance).NullFlavor = (NullFlavor)Util.FromWireFormat(s.GetAttribute("nullFlavor"), typeof(NullFlavor));
            else
            {
                // Try get operator and value
                if (s.GetAttribute("operator") != null)
                    ivlGenericType.GetProperty("Operator").SetValue(instance, Util.FromWireFormat(s.GetAttribute("operator"), typeof(SetOperator?)), null);
                if (s.GetAttribute("value") != null)
                {
                    ivlGenericType.GetProperty("Value").SetValue(instance, Util.FromWireFormat(s.GetAttribute("value"), GenericArguments[0]), null);
                    result.AddResultDetail(new NotSupportedChoiceResultDetail(
                            ResultDetailType.Warning, "Though XML ITS supports it, use of the IVL 'value' attribute should be avoided. The data has been parsed anyways.", s.ToString(), null));
                }
                if (s.GetAttribute("specializationType") != null && result.CompatibilityMode == DatatypeFormatterCompatibilityMode.Canadian)
                    ((ANY)instance).Flavor = s.GetAttribute("specializationType");

                // Get property information
                PropertyInfo lowProperty = ivlGenericType.GetProperty("Low"), 
                    highProperty = ivlGenericType.GetProperty("High"),
                    widthProperty = ivlGenericType.GetProperty("Width"),
                    lowClosedProperty = ivlGenericType.GetProperty("LowClosed"),
                    highClosedProperty = ivlGenericType.GetProperty("HighClosed");

                // Now process the elements
                #region Elements
                if (!s.IsEmptyElement)
                {

                    int sDepth = s.Depth;
                    string sName = s.Name;

                    s.Read();
                    // string Name
                    while (!(s.NodeType == System.Xml.XmlNodeType.EndElement && s.Depth == sDepth && s.Name == sName))
                    {
                        string oldName = s.Name; // Name
                        try
                        {
                            if (s.NodeType == System.Xml.XmlNodeType.Element && s.LocalName == "low") // low value
                            {
                                if (!String.IsNullOrEmpty(s.GetAttribute("inclusive")))
                                    lowClosedProperty.SetValue(instance, Util.FromWireFormat(s.GetAttribute("inclusive"), typeof(bool?)), null);
                                var parseResult = Host.Parse(s, GenericArguments[0]);
                                result.Code = parseResult.Code;
                                result.AddResultDetail(parseResult.Details);
                                lowProperty.SetValue(instance, parseResult.Structure, null);
                            }
                            else if (s.NodeType == System.Xml.XmlNodeType.Element && s.LocalName == "high") // high value
                            {
                                if (!String.IsNullOrEmpty(s.GetAttribute("inclusive")))
                                    highClosedProperty.SetValue(instance, Util.FromWireFormat(s.GetAttribute("inclusive"), typeof(bool?)), null);
                                var parseResult = Host.Parse(s, GenericArguments[0]);
                                result.Code = parseResult.Code;
                                result.AddResultDetail(parseResult.Details);
                                highProperty.SetValue(instance, parseResult.Structure, null);
                            }
                            else if (s.LocalName == "width") // width
                            {
                                var parseResult = Host.Parse(s, typeof(PQ));
                                result.Code = parseResult.Code;
                                result.AddResultDetail(parseResult.Details);
                                widthProperty.SetValue(instance, parseResult.Structure, null);
                            }
                            else if(s.NodeType == System.Xml.XmlNodeType.Element)
                                result.AddResultDetail(new NotImplementedElementResultDetail(ResultDetailType.Warning, s.LocalName, s.NamespaceURI, s.ToString(), null));
                        }
                        catch (MessageValidationException e) // Message validation error
                        {
                            result.AddResultDetail(new MARC.Everest.Connectors.ResultDetail(MARC.Everest.Connectors.ResultDetailType.Error, e.Message, e));
                        }
                        finally
                        {
                            if (s.Name == oldName) s.Read();
                        }
                    }
                }
                #endregion

            }

            // Validate
            ANYFormatter validation = new ANYFormatter();
            validation.Validate(instance as ANY, s.LocalName, result);

            return instance;
        }

        /// <summary>
        /// Gets the type that this formatter handles
        /// </summary>
        public override string HandlesType
        {
            get { return "IVL"; }
        }

        /// <summary>
        /// Get the supported properties for the rendering
        /// </summary>
        public List<PropertyInfo> GetSupportedProperties()
        {
            List<PropertyInfo> retVal = new List<PropertyInfo>(10);
            retVal.AddRange(new PropertyInfo[] {
                typeof(IVL<>).GetProperty("Operator"),
                typeof(IVL<>).GetProperty("Low"),
                typeof(IVL<>).GetProperty("High"),
                typeof(IVL<>).GetProperty("Width"),
                typeof(IVL<>).GetProperty("LowClosed"),
                typeof(IVL<>).GetProperty("HighClosed")
            });
            retVal.AddRange(new PDVFormatter().GetSupportedProperties());
            return retVal;
        }
        #endregion
    }
}
