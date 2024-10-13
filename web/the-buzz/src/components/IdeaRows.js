import Idea from './Idea.js';

function IdeaRows(props) {
    const ideas = props.ideas;

    return (
        <div>
            {ideas.map((idea) => (
                <Idea key={idea.id} title={idea.title} author={idea.author} likes={idea.likes} />
            ))}
        </div>
    )
}

export default IdeaRows;