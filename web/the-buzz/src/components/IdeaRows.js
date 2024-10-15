import Idea from './Idea.js';


function IdeaRows(props) {
    const ideas = props.ideas;

    return (
        <div>
            {ideas.map((idea) => (
                <Idea key={idea.mId} likes={idea.mLikes} message={idea.mMessage} l />
            ))}
        </div>
    )
}

export default IdeaRows;