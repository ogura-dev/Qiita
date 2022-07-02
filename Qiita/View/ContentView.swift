//
//  ContentView.swift
//  Qiita
//
//  Created by ogura on 2022/07/01.
//

import SwiftUI

struct ContentView: View {
    
    @State var articles = [Article]()
    @State var searchText = ""
    @State var page = 1
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = UIColor.rgb(116, 194, 58)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
        UISearchBar.appearance().tintColor = .white
        
        UITableView.appearance().backgroundColor = UIColor.rgb(245, 245, 245)
    }
    
    var body: some View {
        NavigationView {
            List {
                if articles.isEmpty {
                    Text("↑ 記事を検索してね ↑")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                ForEach(articles, id: \.id) { article in
                    NavigationLink {
                        DetailView(article: article)
                    } label: {
                        ArticleRow(article: article)
                            .onAppear {
                                if article.id == articles.last?.id {
                                    page += 1
                                    fetchArticles(page, searchText)
                                }
                            }
                    }
                }
            }
            .padding(.top)
            .refreshable {
                page = 1
                fetchArticles(page, searchText)
            }
            .searchable(text: $searchText, prompt: "記事を検索")
            .onSubmit(of: .search, {
                page = 1
                fetchArticles(page, searchText)
            })
            .navigationTitle("Qiita")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(UIColor.rgb(245, 245, 245)))
        }
    }
    
    func fetchArticles(_ page: Int, _ query: String) {
        let newQuery = query.trimmingCharacters(in: .whitespaces)
        let url = URL(string: "https://qiita.com/api/v2/items?page=\(page)&per_page=20&query=\(newQuery)")!
        var request = URLRequest(url: url)
        request.setValue("Authorization", forHTTPHeaderField: "Bearer d88f0e1d98ef3e94d7a4eb2a504079bb5e38d818")
        URLSession.shared.dataTask(with: request) { data, urlResponse, error in
            if let error = error {
                print("error: \(error)")
                return
            }
            guard let data = data else { return }
            do {
                if page == 1 {
                    articles = try JSONDecoder().decode([Article].self, from: data)
                } else {
                    articles.append(contentsOf: try JSONDecoder().decode([Article].self, from: data))
                }
            } catch let e {
                print("decode error: \(e)")
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
