/*
 * Copyright (C) 2005-2013 by Marc Boris Duerner
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

#ifndef Pt_Utf8Codec_h
#define Pt_Utf8Codec_h

#include <Pt/Api.h>
#include <Pt/TextCodec.h>
#include <Pt/String.h>
#include <string>

namespace Pt {

/** @brief This Codec class is able to convert from UTF-8 to UTF-32 and from UTF-32 to UTF-8.
    
    The method do_in() converts an array of char containing UTF-8-encoded data into an array
    of Pt::Char which is UTF-32-encoded, which means that the data is a direct readable
    32-bit representation of the character.
    
    The method do_out() converts an array of Pt::Char objects (UTF-32/Unicode) into an
    array of char which contains the same sequence of characters in UTF-8-encoding.

    @ingroup Unicode
*/
class PT_API Utf8Codec : public TextCodec<Char, char> 
{
    public:
        /**
            * @brief Constructs a new Utf8Codec object which converts UTF-8 to UTF-32 and UTF-32 to UTF-8.
            *
            * The internal type is Pt::Char and external type is $char$
            *
            * @param ref This optional parameter is passed to std::codecvt. When ref == 0 the locale takes
            * care of deleting the facet. If ref == 1 the locale does not destroy the facet. Default value is 0.
            */
        explicit Utf8Codec(std::size_t ref = 0);

        //! @brief Destructor.
        virtual ~Utf8Codec()
        {}

        //! @brief Decodes UTF-8 to UTF-32.
        virtual result do_in(MBState& s, const char* fromBegin,
                                         const char* fromEnd, const char*& fromNext,
                                         Char* toBegin, Char* toEnd, Char*& toNext) const;

        //! @brief Encodes UTF-32 to UTF-8.
        virtual result do_out(MBState& s, const Char* fromBegin,
                                          const Char* fromEnd, const Char*& fromNext,
                                          char* toBegin, char* toEnd, char*& toNext) const;

        // inheritdoc
        virtual bool do_always_noconv() const throw();

        // inheritdoc
        virtual int do_length(MBState& s, const char* fromBegin, const char* fromEnd, std::size_t max) const;

        // inheritdoc
        virtual int do_max_length() const throw();

        // inheritdoc
        std::codecvt_base::result do_unshift(Pt::MBState&, char*, char*, char*&) const;

        // inheritdoc
        int do_encoding() const throw();

        static String decode(const char* data, std::size_t size);
        
        static String decode(const std::string& data)
        { return decode(data.data(), data.size()); }

        static std::string encode(const Char* data, std::size_t size);
        
        static std::string encode(const String& data)
        { return encode(data.data(), data.size()); }
};

} //namespace Pt

#endif // Pt_Utf8Codec_h
