﻿namespace RemObjects.Elements.RTL;

interface

uses
{$IF ECHOES}
  System.Collections.Generic,
{$ELSEIF COOPER}
  com.remobjects.elements.linq,
{$ELSEIF TOFFEE}
  Foundation,
  RemObjects.Elements.Linq,
{$ENDIF}
  RemObjects.Elements.RTL;

{$IF ECHOES}
[assembly: NamespaceAlias('RemObjects.Elements.RTL', ['System.Linq'])]
[assembly: NamespaceAlias('RemObjects.Elements.RTL.Linq', ['System.Linq'])]
{$ELSEIF COOPER}
[assembly: NamespaceAlias('RemObjects.Elements.RTL', ['com.remobjects.elements.linq'])]
[assembly: NamespaceAlias('RemObjects.Elements.RTL.Linq', ['com.remobjects.elements.linq'])]
{$ELSEIF TOFFEE}
[assembly: NamespaceAlias('RemObjects.Elements.RTL', ['RemObjects.Elements.Linq'])]
[assembly: NamespaceAlias('RemObjects.Elements.RTL.Linq', ['RemObjects.Elements.Linq'])]
{$ENDIF}

{$IF TOFFEE}
extension method Foundation.INSFastEnumeration.ToList: not nullable List<id>; public;
extension method Foundation.INSFastEnumeration.ToArray: not nullable array of id; public;
extension method Foundation.INSFastEnumeration.ToDictionary(aKeyBlock: IDBlock; aValueBlock: IDBlock): not nullable Dictionary<id,id>; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.ToList: not nullable List<T>; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.ToArray: not nullable array of T; inline; public;
//extension method RemObjects.Elements.System.INSFastEnumeration<T>.ToDictionary<K,V>(aKeyBlock: block(aItem: id): K; aValueBlock: block(aItem: id): V): not nullable Dictionary<K,V>; public;
{$ENDIF}

implementation

{$IF TOFFEE}
extension method Foundation.INSFastEnumeration.ToList(): not nullable List<id>;
begin
  result := self.array().mutableCopy() as not nullable;
end;

extension method Foundation.INSFastEnumeration.ToArray: not nullable array of id;
begin
  result := (self.array() as List<id>).ToArray() as not nullable;
end;

extension method Foundation.INSFastEnumeration.ToDictionary(aKeyBlock: IDBlock; aValueBlock: IDBlock): not nullable Dictionary<id,id>;
begin
  result := dictionary(aKeyBlock, aValueBlock) as NSMutableDictionary;
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.ToList: not nullable List<T>;
begin
  exit Foundation.INSFastEnumeration(self).array().mutableCopy() as not nullable;
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.ToArray: not nullable array of T;
begin
  exit (Foundation.INSFastEnumeration(self).array() as List<T>).ToArray() as not nullable;
end;

{extension method RemObjects.Elements.System.INSFastEnumeration<T>.ToDictionary<K,V>(aKeyBlock: block(aItem: id): K; aValueBlock: block(aItem: id): V): not nullable Dictionary<K,V>;
begin
  exit Foundation.INSFastEnumeration(self).dictionary(IDBlock(aKeyBlock), IDBlock(aValueBlock));
end;}
{$ENDIF}

end.
    