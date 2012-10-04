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
 * User: Justin Fyfe
 * Date: 10-04-2012
 */
package ca.marc.everest.datatypes.interfaces;

import ca.marc.everest.datatypes.PQ;
/**
 * Represents classes where the distance between two instances of the class can be calculated as a 
 * quantity
 */
public interface IDistanceable<T> {

	/**
	 * Calculates the distance between the current instance and other
	 * @param other The other instance to calculate distance between
	 */
	PQ distance(T other);
}
