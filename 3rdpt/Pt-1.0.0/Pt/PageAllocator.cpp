/*
 * Copyright (C) 2009-2010 by Bendri Batti
 * Copyright (C) 2009-2013 by Marc Boris Duerner
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * As a special exception, you may use this file as part of a free
 * software library without restriction. Specifically, if other files
 * instantiate templates or use macros or inline functions from this
 * file, or you compile this file and link it with other files to
 * produce an executable, this file does not by itself cause the
 * resulting executable to be covered by the GNU General Public
 * License. This exception does not however invalidate any other
 * reasons why the executable file might be covered by the GNU Library
 * General Public License.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */		

#include <Pt/PageAllocator.h>

namespace Pt {

PageAllocator::Page::Page(Page* nextChunk, std::size_t chunkSize)
: _nextChunk(0)
, _mem(0)
, _chunkSize(chunkSize > MinChunkSize ? chunkSize : MinChunkSize)
, _bytesAlreadyAllocated(0)
{
    _nextChunk = nextChunk;
    _mem = new char[ _chunkSize ];
}


PageAllocator::Page::~Page()
{
    delete [] _mem;
}


void* PageAllocator::Page::allocate(std::size_t reqSize)
{
    void* addr = _mem  + _bytesAlreadyAllocated;
    _bytesAlreadyAllocated += reqSize;

    return addr;
}


PageAllocator::PageAllocator( std::size_t size )
: _listOfVariableChunk(0)
{
    expandStorage(size);
}


PageAllocator::~PageAllocator()
{
    Page* memchunk = _listOfVariableChunk;
    while( memchunk )
    {
        _listOfVariableChunk = memchunk->nextVariableChunk();
        delete memchunk;
        memchunk = _listOfVariableChunk;
    }
}


void* PageAllocator::allocate( std::size_t size )
{
    std::size_t space = _listOfVariableChunk->spaceAvailable();
    if( size > space )
        expandStorage( size );

    return _listOfVariableChunk->allocate(size);
}


void PageAllocator::deallocate( void* p, std::size_t size )
{
}


void PageAllocator::expandStorage(std::size_t size)
{
    // TODO: shouldn't size be the current chunk size ?
    _listOfVariableChunk = new Page(_listOfVariableChunk, size);
}

} // namespace Pt
