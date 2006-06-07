/* valaformalparameter.vala
 *
 * Copyright (C) 2006  Jürg Billeter
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 * Author:
 * 	Jürg Billeter <j@bitron.ch>
 */

using GLib;

namespace Vala {
	public class FormalParameter : CodeNode {
		public string name { get; construct; }
		public TypeReference type_reference { get; construct; }
		public bool ellipsis { get; construct; }
		public SourceReference source_reference { get; construct; }
		public Expression default_expression { get; set construct; }
		
		public static ref FormalParameter new (string name, TypeReference type, SourceReference source) {
			return (new FormalParameter (name = name, type_reference = type, source_reference = source));
		}
		
		public static ref FormalParameter new_ellipsis (SourceReference source) {
			return (new FormalParameter (ellipsis = true, source_reference = source));
		}
		
		public override void accept (CodeVisitor visitor) {
			if (!ellipsis) {
				type_reference.accept (visitor);
			}
			
			visitor.visit_formal_parameter (this);
		}
	}
}
