//
//  WorkoutCard.swift
//
//  OutRun
//  Copyright (C) 2020 Tim Fraedrich <timfraedrich@icloud.com>
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

import SwiftUI

struct WorkoutCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("ExampleMap")
                    .resizable()
                    .frame(width: 64, height: 64, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15.0)
                VStack(alignment: .leading) {
                    Text("Bike")
                        .foregroundColor(Color(.accentColor))
                        .font(.title)
                    Text("Today - 9:41")
                        .foregroundColor(.secondary)
                }
                .padding()
            }
            HStack {
                VStack {
                    Text("64km")
                        .bold()
                        .font(.title)
                    Text("Distance")
                        .foregroundColor(Color(.secondaryColor))
                }
                    .padding()
                Spacer()
                VStack {
                    Text("25:36m")
                        .bold()
                        .font(.title)
                    Text("Time")
                        .foregroundColor(Color(.secondaryColor))
                }
                    .padding()
                Spacer()
                VStack {
                    Text("3:30")
                        .bold()
                        .font(.title)
                    Text("Pace")
                        .foregroundColor(Color(.secondaryColor))
                }
                    .padding()
            }
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCard()
            .previewLayout(.device)
    }
}

