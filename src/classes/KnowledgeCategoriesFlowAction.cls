global class KnowledgeCategoriesFlowAction {

     @AuraEnabled
    public static String GetCategories() {
        String ReturnString = '';
        //return ' [{"label": "User","name": "1", "disabled": false,"expanded": true, "items": [{"label": "Standard User", "name": "2", "disabled": false,"expanded": true,"items": [] }, { "label": "Chatter User", "name": "3", "disabled": false, "expanded": true, "items": [] }] }, { "label": "Administrator", "name": "4",  "disabled": false,  "expanded": true,"items": [{ "label": "System Administrator", "name": "5", "disabled": false,  "expanded": true, "items": [] }, {  "label": "Chatter Administrator", "name": "6", "disabled": false, "expanded": true, "items": [] }] }, {"label": "Community User",  "name": "7","disabled": false,"expanded": true, "items": [{ "label": "Community Login User","name": "8", "disabled": false, "expanded": true, "items": [] }, {"label": "Community Plus Login User","name": "9", "disabled": false, "expanded": true, "items": []}]}]';
 		System.Debug('GetCategories');
        
        List<KnowledgeCategoriesFlowActionResult> TheResults = new List<KnowledgeCategoriesFlowActionResult>();
    
        List<DescribeDataCategoryGroupResult> describeCategoryResult;
        List<DescribeDataCategoryGroupStructureResult> describeCategoryStructureResult;
        
        List<String> objType = new List<String>();
        objType.add('KnowledgeArticleVersion');
        describeCategoryResult = Schema.describeDataCategoryGroups(objType);
        
        //Creating a list of pair objects to use as a parameter
        //for the describe call
        List<DataCategoryGroupSobjectTypePair> pairs = new List<DataCategoryGroupSobjectTypePair>();
        
        //Looping throught the first describe result to create
        //the list of pairs for the second describe call
        for(DescribeDataCategoryGroupResult singleCat : describeCategoryResult){
            DataCategoryGroupSobjectTypePair p = new DataCategoryGroupSobjectTypePair();
            p.setSobject(singleCat.getSobject());
            p.setDataCategoryGroupName(singleCat.getName());
            pairs.add(p);
        }
        
        //describeDataCategoryGroupStructures()
        describeCategoryStructureResult = Schema.describeDataCategoryGroupStructures(pairs, false);
        
        ReturnString += '[';
        Integer Counter = 0;
        for(DescribeDataCategoryGroupStructureResult singleCategory : describeCategoryStructureResult){
            DataCategory [] toplevelCategories = singleCategory.getTopCategories();
            
            
            for(DataCategory dCategory : toplevelCategories) {
                System.debug('Top Category: ' + dCategory.getLabel());
                
                if (Counter > 0)
            		ReturnString += ',';
                
                ReturnString += '{"label":"';
                ReturnString += SingleCategory.getLabel();
                ReturnString += '","name":"';
                ReturnString += SingleCategory.getName();
                ReturnString += '","disabled":false,"expended":false';
                
                String ChildCategories = GetCategoriesJSON(dCategory);
                if (ChildCategories.length() > 0)
                {
                    ReturnString += ',"items":';
                    ReturnString += ChildCategories;
                }
                ReturnString += '}';
            }
            
            Counter++;
        }
        ReturnString += ']';
        System.Debug(ReturnString);
        return ReturnString;
    
        
    }

    
    @InvocableMethod(label='Get Knowledge Categories' )
  	global static List<KnowledgeCategoriesFlowActionResult> GetKnowledgeCategories(List<KnowledgeCategoriesFlowActionRequest> Requests) {
    	List<KnowledgeCategoriesFlowActionResult> TheResults = new List<KnowledgeCategoriesFlowActionResult>();
    
        List<DescribeDataCategoryGroupResult> describeCategoryResult;
        List<DescribeDataCategoryGroupStructureResult> describeCategoryStructureResult;
        
        List<String> objType = new List<String>();
        objType.add('KnowledgeArticleVersion');
        describeCategoryResult = Schema.describeDataCategoryGroups(objType);
        
        //Creating a list of pair objects to use as a parameter
        //for the describe call
        List<DataCategoryGroupSobjectTypePair> pairs = new List<DataCategoryGroupSobjectTypePair>();
        
        //Looping throught the first describe result to create
        //the list of pairs for the second describe call
        for(DescribeDataCategoryGroupResult singleCat : describeCategoryResult){
            DataCategoryGroupSobjectTypePair p = new DataCategoryGroupSobjectTypePair();
            p.setSobject(singleCat.getSobject());
            p.setDataCategoryGroupName(singleCat.getName());
            pairs.add(p);
        }
        
        //describeDataCategoryGroupStructures()
        describeCategoryStructureResult = Schema.describeDataCategoryGroupStructures(pairs, false);
        
        System.Debug('Get Knowledge Categories start');
        for (KnowledgeCategoriesFlowActionRequest TheRequest : Requests)
        {
            KnowledgeCategoriesFlowActionResult SingleResult = new KnowledgeCategoriesFlowActionResult();
            
            System.Debug('Handling request');
            if (TheRequest.ParentLabel == '')
            {
                System.Debug('Label is empty');
                
         		//Getting data from the result
         		for(DescribeDataCategoryGroupStructureResult singleCategory : describeCategoryStructureResult){
                    KnowledgeCategories Category = new KnowledgeCategories();
            		//Getting the name of the category
            		Category.Name = singleCategory.getName();
                    System.debug(singleCategory.Name);
					Category.Label = singleCategory.getLabel();
					
            		SingleResult.CategoryList.Add(Category);
        		}         
            }
            else
            {
                System.debug('Searching for ' + TheRequest.ParentLabel);
                Boolean bFound = false;
                
                for(DescribeDataCategoryGroupStructureResult singleCategory : describeCategoryStructureResult){
                    
                    if (singleCategory.getName() == TheRequest.ParentLabel)
                    {
                        // In this case the search string is a group name
                        // 
                        bFound = true;
                        DataCategory [] toplevelCategories = singleCategory.getTopCategories();
            
            			for(DataCategory dCategory : toplevelCategories) {
                                                
                            System.Debug('Top Level: ' + dCategory.getName());
                            
                            DataCategory[] childCategories = dCategory.getChildCategories();
                            
                            for (DataCategory ChildCategory : childCategories)
                            {
                                KnowledgeCategories Category = new KnowledgeCategories();
                                Category.Name = ChildCategory.getName();
                                Category.Label = ChildCategory.getLabel();
                                SingleResult.CategoryList.Add(Category);
                            }
                            
                            //Get the list of sub categories in the category
                            //DataCategory [] childCategories = category.getChildCategories();
            			}
                    }
        		}
                
                if (!bFound)
                {
                    // It was not a Group name, so now we need to search for a Category with that name.
                    
                    for(DescribeDataCategoryGroupStructureResult singleCategory : describeCategoryStructureResult){
                        DataCategory [] toplevelCategories = singleCategory.getTopCategories();
                         
                        for(DataCategory dCategory : toplevelCategories) {
                                                
                           System.Debug('Top Level: ' + dCategory.getName());
                            
                           DataCategory[] Results = FindCategories(TheRequest.ParentLabel, dCategory);
                            
                           if (Results.size() > 0)
                           {
                             	for (DataCategory ChildCategory : Results)  
                                {
                                    KnowledgeCategories Category = new KnowledgeCategories();
                                	Category.Name = ChildCategory.getName();
                                	Category.Label = ChildCategory.getLabel();
                                	SingleResult.CategoryList.Add(Category);
                                }
                           }
                       }
                    }
                }
            }
            
            TheResults.add(SingleResult);
        }
    
        return TheResults;
    }
    
    global class KnowledgeCategoriesFlowActionResult {
        public  KnowledgeCategoriesFlowActionResult()
        {
            CategoryList = new List<KnowledgeCategories>();
        }
        @InvocableVariable
     	public List<KnowledgeCategories> CategoryList;
    }
    
      global class KnowledgeCategoriesFlowActionRequest {
        @InvocableVariable
        global String ParentLabel;
        
    }
    
    private static DataCategory[] FindCategories(String SearchString, DataCategory Parent){
        DataCategory[] Results = new DataCategory[]{};
             
        System.Debug('Inside Find: '  + Parent.GetName());
        
      	if (Parent.getName() == SearchString)
            return Parent.getChildCategories();
        else
        {
            DataCategory[] Childs = Parent.getChildCategories();
            for (DataCategory ChildCategory : Childs)
            {
                Results = FindCategories(SearchString, ChildCategory);
                if (Results.size() > 0)
                    return Results;
            }
            
        }
        return Results;
      
   }
    
    private static String GetCategoriesJSON(DataCategory Parent) {
        String JSONResult = '';
        Integer Items = 0;
   
        System.Debug('GetCategoriesJSON for ' + Parent.getName());
            
        
        Datacategory[] Childs = Parent.getChildCategories();
        
        System.Debug('Childs retrieve');
        if (Childs != null)
        {
            for (DataCategory Child : Childs)
            {
                System.Debug('Child: ' + Child.getName());
                if (Items == 0)
                    JSONResult += '[';
                else
                    JSONResult += ',';
                
                JSONResult += '{"label":"';
                JSONResult += Child.getLabel();
                JSONResult += '","name":"';
                JSONResult += Child.getName();
                JSONResult += '","disabled":false,"expanded":false';
                
                String ChildItems = GetCategoriesJSON(Child);
                if (ChildItems.length() > 0)
                {
                    JSONResult += ',"items":';
                    JSONResult += ChildItems;
                }
                JSONREsult += '}';
                Items++;
                
            }
        }
        if (Items > 0)
        	JSONResult += ']';
        return JSONResult;
    }
    
}