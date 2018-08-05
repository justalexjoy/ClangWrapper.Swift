//
//  SyntaxOutlineViewController.swift
//  ClangWrapper
//
//  Created by Hoon H. on 2015/01/24.
//  Copyright (c) 2015 Eonil. All rights reserved.
//

import Foundation
import AppKit




class SyntaxOutlineViewController: NSViewController, NSOutlineViewDataSource, NSOutlineViewDelegate {
	
	enum Column: String	{
		case Name			=	"NAME"
		case Spelling		=	"SPELLING"
		case Kind			=	"KIND"
		case Extent			=	"EXTENT"
		case Description	=	"DESCRIPTION"
	}
	
	var	rootNodeRepresentation:ASTRootNode? {
		get {
			return	self.representedObject as! ASTRootNode?
		}
		set(v) {
			self.representedObject	=	v
			self.outlineView.reloadData()
		}
	}
	
	var	outlineView:NSOutlineView {
		get {
			return	view as! NSOutlineView
		}
	}
	override func loadView() {
		super.view	=	NSOutlineView()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		self.outlineView.dataSource = self
		self.outlineView.delegate = self
		
		func makeColumn(_ id:Column, _ title:String) -> NSTableColumn {
			let	c	=	NSTableColumn()
			c.identifier	=	id.rawValue
			c.title			=	title
			c.width			=	200
			return	c
		}
	
		let	cs	=	[
			makeColumn(Column.Name, "Name"),
			makeColumn(Column.Kind, "Kind"),
			makeColumn(Column.Spelling, "Spelling"),
			makeColumn(Column.Extent, "Extent"),
			makeColumn(Column.Description, "Description"),
		]
		cs.map(self.outlineView.addTableColumn)
		self.outlineView.outlineTableColumn	=	cs[0]
		self.outlineView.rowSizeStyle		=	NSTableViewRowSizeStyle.small
	}
	
	func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
		if rootNodeRepresentation == nil {
			return	0
		}
		if item == nil {
			return	1
		}
		if let m = item as? ASTNodeNavigation {
			return	m.allChildNodes.count
		}
		fatalError()
	}
//	func outlineView(outlineView: NSOutlineView, objectValueForTableColumn tableColumn: NSTableColumn?, byItem item: AnyObject?) -> AnyObject? {
//		
//	}
	func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
		if item == nil {
			return	rootNodeRepresentation!
		}
		if let m = item as? ASTNodeNavigation {
			let	n	=	m.allChildNodes[index]
			return	n 
		}
		fatalError()
	}
	func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
		return	self.outlineView(outlineView, numberOfChildrenOfItem: item) > 0
	}
	func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
		func getView() -> NSTableCellView {
			if let v1:AnyObject = outlineView.make(withIdentifier: tableColumn!.identifier, owner: nil) {
				return	v1 as! NSTableCellView
			}
			
			let	t	=	NSTextField()
//			let	m	=	NSImageView()
			let	v	=	NSTableCellView()
			
			v.textField	=	t
//			v.imageView	=	m
			
			v.addSubview(t)
//			v.addSubview(m)

			t.isEditable			=	false
			t.isBordered			=	false
			t.lineBreakMode		=	NSLineBreakMode.byTruncatingTail
			t.backgroundColor	=	NSColor.clear

			return	v
		}
		
		////
		
		func selectText(_ item:AnyObject) -> String {
			let	col	=	Column(rawValue: tableColumn!.identifier)!
			
			if col == Column.Name {
				return	(item as! ASTNode).name
			}
			if let n = item as? ASTNode {
				switch col {
				case .Spelling:		return	n.textForField(ASTNodeField.spelling)
				case .Kind:			return	n.textForField(ASTNodeField.kind)
				case .Extent:		return	n.textForField(ASTNodeField.extent)
				case .Description:	return	n.textForField(ASTNodeField.description)
				default:
					fatalError()
				}
			}
			fatalError()
		}
		func selectForeColor(_ item:AnyObject) -> NSColor {
			if let n = item as? ASTNode {
//				if n.shouldDisplayAsInactive() {
//					return	NSColor.disabledControlTextColor()
//				} else {
					return	NSColor.controlTextColor
//				}
			}
			fatalError()
		}
		
		////
		
		let	v						=	getView()
		v.textField!.stringValue	=	selectText(item as AnyObject)
		v.textField!.textColor		=	selectForeColor(item as AnyObject)
		
		return	v
	}
}

