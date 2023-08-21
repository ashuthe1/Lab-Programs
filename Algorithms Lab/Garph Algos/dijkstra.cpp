#include<bits/stdc++.h>
using namespace std;

void dijkstra(int &src, vector<int>&distance, vector<pair<int,int> > adj[])
{
	set<pair<int, int> >st;
	st.insert({0, src});
	distance[src] = 0;
	
	while(!st.empty())
	{
		auto it = st.begin();
		st.erase(st.begin());
		
		int top = ((*it).second), dist = (*it).first;
		for(auto &e : adj[top])
		{
			int child = e.second, wt = e.first;
			if(distance[child] > distance[top] + wt)
			{
				distance[child] = distance[top] + wt;
				st.insert({distance[child], child});
			}
		}
	}
}
void printdistancence(int &src, vector<int>&distance, int n)
{
	cout << "distancence of " << src << " from all other vertexs is \n";
	for(int i = 1; i <= n; i++)
	{
		cout << i << " = " << distance[i] << endl; 
	}
}
int main()
{
	cout << "Enter number of vertices & Edges\n";
	int n, m, src; cin >> n >> m;
	
	vector<pair<int,int>> adj[n+1];
	vector<int>dist(n+1, INT_MAX);
	
	for(int i = 0; i < m; i++)
	{
		int u, v, wt;
		cin >> u >> v >> wt;
		adj[u].push_back({wt, v});
		adj[v].push_back({wt, u});
	}
	cout << "Enter the Source Vertex\n";
	cin >> src;

	dijkstra(src, dist, adj);
	printdistancence(src, dist, n);
	return 0;
}

