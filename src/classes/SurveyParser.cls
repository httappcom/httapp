public with sharing class SurveyParser {
	public String surveyTitle { get; private set; }
	
	private String surveyName = null;
	
	private static Map<String, Component> componentMap = null;

	private static Integer parseInt( String sInt ) {
		return sInt==null?null:Integer.valueOf(sInt);
	}
	public class SurveyPage {
		public String title { get; private set; }
		public List<SurveyRow> rows { get; private set; }
		public SurveyPage( Dom.XmlNode node) {
			rows = new List<SurveyRow>();
			this.title = node.getAttribute( 'title', null);
			Dom.XmlNode[] rowNodes = node.getChildElements();
			for (Dom.XmlNode rowNode : rowNodes ) {
				rows.add(new SurveyRow( rowNode ));
			}
		}
	}
	private static Component parseComponentRef( Dom.XmlNode node ) {
		String compId = node.getAttribute( 'componentid', null);
		return componentMap.get(compId);
	}
	public class SurveyRow {
		public String type { get; private set; }
		public List<Component> components { get; private set; }
		public SurveyRow( Dom.XmlNode row ) {
			components = new List<Component>();
			this.type = row.getAttribute( 'type', null);
			Component component = parseComponentRef( row );
			if (component != null) {
				components.add(component);
			} else {
				Dom.XmlNode[] compRefNodes = row.getChildElements();
				for (Dom.XmlNode compRef : compRefNodes) {
					components.add(parseComponentRef( compRef ));
				}
			}
		}
	}
	public class Component {
		public String type { get; private set; }
		public String prompt { get; private set; }
		public String id { get; private set; }
		public Integer size { get; private set; }
		public Component( Dom.XmlNode node ) {
			this.prompt = node.getAttribute('prompt', null);
			this.type = node.getAttribute('type', null);
			this.id = node.getAttribute('id', null);
			this.size = parseInt(node.getAttribute('size', null));
		}
	}

	public SurveyParser( String name ) {
		this.surveyName = name;
	}
    private String getSurveySpec( String surveySpecName ) {
        Document[] docs = [select body from document where name=:surveySpecName];
        return docs.size()>0?docs[0].body.toString():null;
    }

	public List<SurveyPage> pages = new List<SurveyPage>();
	private void parsePages( Dom.XmlNode[] nodes ) {
		for (Dom.XmlNode node : nodes) {
			pages.add(new SurveyPage( node ));
		}
	}
	private void parseComponents( Dom.XmlNode[] nodes ) {
		for (Dom.XmlNode node : nodes) {
			Component comp = new Component( node );
			componentMap.put(comp.id, comp);
		}
	}
	public void parse() {
		componentMap = new Map<String, Component>();
        String spec = getSurveySpec( surveyName );
        Dom.Document doc = new Dom.Document();
        doc.load(spec);
        Dom.XmlNode rootNode = doc.getRootElement();
        surveyTitle = rootNode.getAttribute('title', null);
        Dom.XmlNode[] mainNodes = rootNode.getChildElements();
        for (Dom.XmlNode node : mainNodes) {
        	if (node.getName().toLowerCase()=='components') {
        		parseComponents(node.getChildElements());
        	} else if (node.getName().toLowerCase()=='pages') {
        		parsePages(node.getChildElements());
        	}
        }
        system.debug('surveyTitle='+surveyTitle);
	}
    public static void test() {
		SurveyParser parser = new SurveyParser( 'General Medical Profile Spec' );
		parser.parse();
    }
}