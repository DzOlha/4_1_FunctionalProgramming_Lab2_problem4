type Graph = [[Int]]
type Path = [Int]

-- Визначити всі шляхи у зв'язаному графі з однієї обраної вершини до іншої.

findPaths :: Graph -> Int -> Int -> [Path]
findPaths graph start end = dfs graph start end []


dfs :: Graph -> Int -> Int -> Path -> [Path]
dfs graph current end path
    | current == end = [path ++ [end]]
    | otherwise = concatMap (\neighbor -> dfs graph neighbor end (path ++ [current])) neighbors
    where neighbors = filter (`notElem` path) (graph !! current)


main :: IO ()
main = do
      let graph = [[1, 3, 4], [0, 2, 3], [1, 3], [0, 1, 2, 4], [0, 3]]
      print $ findPaths graph 0 1